DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
NVM_DIR := $(HOME)/.nvm
VUNDLE := $(HOME)/.vim/bundle/Vundle.vim

brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile

cask-apps: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Caskfile

code-extensions:
	for EXT in $$(cat install/Codefile); do code --install-extension $$EXT; done

npm:
	if ! [ -d $(NVM_DIR)/.git ]; then git clone https://github.com/creationix/nvm.git $(NVM_DIR); fi
	. $(NVM_DIR)/nvm.sh; nvm install --lts

node-packages: npm
	npm install -g $(shell cat install/npmfile)

rust:
	is-executable rustup || curl curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

stack:
	is-executable stack || curl -sSL https://get.haskellstack.org/ | sh

vundle:
	[ -d $(VUNDLE) ] || git clone https://github.com/VundleVim/Vundle.vim.git $(VUNDLE)

vim-plugins: vundle
	vim +PluginInstall +qall

link:
	stow -t $(HOME) runcom
	stow -t $(HOME) config

unlink:
	stow --delete -t $(HOME) runcom
	stow --delete -t $(HOME) config
