#!/usr/bin/env bash

# Common functions
. ../functions/function 

pushd $HOME

if ! is_executable ruby -o ! is_executable curl -o ! is_executable git; then
  echo "Skipped: Homebrew (not found: ruby, curl and/or git)"
  exit 0
fi

if [ ! -d $HOME/homebrew ]; then
    mkdir $HOME/homebrew
fi
#### PATH

#sudo chown $(whoami):admin $HOME/homebrew 

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew)"
fi

if ! is_executable brew; then
  echo "Skipping: Homebrew packages (not found: brew)"
  exit 0
fi

# brew cask
brew tap caskroom/cask
brew tap caskroom/fonts    
brew tap caskroom/versions

brew doctor
brew update
brew upgrade
brew prune
brew cleanup

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

formulas=(
	cscope
	ctags
	#python
	gcc
	readline
	xz
	imagemagick
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        echo "brew install $formula"
        brew install $formula
    fi
done

formulas=(
	grep
	screen	
	gnu-sed
	gnu-indent
	gnu-tar
	gawk
	findutils
	coreutils
	moreutils
	zsh
	z
	zsh-completions
	zsh-syntax-highlighting
	#'macvim --with-cscope'
	tmux
	battery
	# reattach-to-user-namespace
	graphviz
	diff-so-fancy
	fzf
	tree
	# highlight
	awscli
	kubectl
	grpc
	'go --cross-compile-common'
	aws-shell
	ack
	the_silver_searcher
	rename
	wget
	psgrep
	checkstyle
	watch
	htop
	pandoc
	maven
	ant
	app-engine-java-sdk
	google-app-engine
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        echo "brew install $formula"
        brew install $formula
    fi
done

brew cask search chrome

cask_formulas=(
	atom
	flux
	macdown
	font-menlo-for-powerline
	font-firacode-nerd-font
	font-firacode-nerd-font-mono
	font-firamono-nerd-font
	font-firamono-nerd-font-mono
	# sublime-text
	# clion
	# the-unarchiver
	# mactex
	# xquartz
	# gimp
	google-cloud-sdk	
	# quicksilver
)

for formula in "${cask_formulas[@]}"; do
  echo "brew cask install $formula"
  brew cask install $formula
done

brew cask doctor
brew cask list
brew cask cleanup
brew cleanup

popd
