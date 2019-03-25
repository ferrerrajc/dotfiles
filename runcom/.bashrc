READLINK=$(command -v greadlink 2>/dev/null || command -v readlink)
CURRENT_SCRIPT=${BASH_SOURCE[1]}

# Resolve DOTFILES_DIR

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
for DOTFILE in "$DOTFILES_DIR"/include/.{env,alias,nvm}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

for DOTFILE in $HOME/.{env,alias}.local; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE
export DOTFILES_DIR
