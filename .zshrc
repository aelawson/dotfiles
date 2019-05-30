source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle sindresorhus/pure

git config --global init.templatedir '~/.git_template'

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

git config --global alias.ctags '!.git/hooks/ctags'

export GOPATH=$HOME/go
export PATH=$PATH:/user/local/go/bin:$GOPATH/bin
export EDITOR="vim"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

alias ls='exa'
alias gcz='git cz'

bindkey '^ ' autosuggest-accept

fpath+=${ZDOTDIR:-~}/.zsh_functions
