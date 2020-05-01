READLINK=$(command -v greadlink 2>/dev/null || command -v readlink)
# https://stackoverflow.com/questions/9901210/bash-source0-equivalent-in-zsh
CURRENT_SCRIPT=${(%):-%N}

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# include files
for DOTFILE in "$DOTFILES_DIR"/include/.{env,alias,ohmyzsh,nvm}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

for DOTFILE in $HOME/.{env,alias}.local; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE
export DOTFILES_DIR

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
