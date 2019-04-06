# Setup Homebrew
echo 'Installing HomeBrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

# Install core packages
echo 'Installing core packages...'
brew install bash
brew install zsh
brew install htop
brew install wget
brew install vim
brew install lnav
brew install loadtest
brew install coreutils
brew install findutils
brew install gnu-tar
brew install gnu-sed
brew install gawk
brew install gnutls
brew install gnu-indent
brew install gnu-getopt
brew install docker
brew install python3
brew install go
brew install node
brew install yarn
brew install vim
brew install tmux
brew install reattach-to-user-namespace
brew install hub
brew install go-jira
brew install diff-so-fancy
brew install fzf
brew install jq
brew install ripgrep
brew install httpie

brew tap moncho/dry
brew install dry

brew tap-pin dbcli/tap
brew install mycli
brew install pgcli
echo 'Complete!'

# Install macOS packages
echo 'Installing macOS packages...'
brew install cask
brew install iterm2
brew install firefox
brew install spotify
brew install slack
brew install focus
brew install 1password-cli
brew install lastpass-cli --with-pinentry
echo 'Complete!'

# Install global NPM packages
echo 'Installing global NPM packages...'
yarn global add commitizen
yarn global add cz-conventional-changelog
echo 'Complete!'

# Make ZSH default shell
chsh -s /bin/zsh

# Setup terminal
tic -x xterm-256color-italic.terminfo
tic -x tmux-256color.terminfo
