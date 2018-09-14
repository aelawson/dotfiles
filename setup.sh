# Setup Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

# Install core packages
brew install zsh
brew install htop
brew install wget
brew install lnav
brew install loadtest
brew install coreutils
brew install docker
brew install python3
brew install go
brew install node
brew install yarn
brew install vim
brew install tmux
brew install hub
brew install go-jira
brew install diff-so-fancy
brew install fzf
brew install ripgrep
brew install httpie

brew tap-pin dbcli/tap
brew install mycli
brew install pgcli

# Install macOS packages
brew install cask
brew install iterm2
brew install firefox
brew install spotify
brew install slack
brew install focus
brew install 1password-cli
brew install lastpass-cli --with-pinentry

# Install global NPM packages
yarn global add commitizen
yarn global add cz-conventional-changelog

# Setup zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Setup terminal
tic -x xterm-256color-italic.terminfo
tic -x tmux-256color.terminfo
