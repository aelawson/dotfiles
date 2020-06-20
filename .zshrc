# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.6.2
source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle MichaelAquilina/zsh-you-should-use
antibody bundle 'wfxr/forgit'
antibody bundle romkatv/powerlevel10k

git config --global init.templatedir '~/.git_template'

export GOPATH=$HOME/dev/go:$HOME/dev/server/go
export PATH=$PATH:/user/local/go/bin:~/dev/go/bin:~/dev/server/go/bin:/usr/local/Cellar/node/14.2.0/bin

export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --no-messages --follow --glob '!.git/*'"
export FZF_DEFAULT_OPTS="--preview-window='right:60%'"

alias ls='lsd'
alias gcz='git cz'

# Dropbox aliases
alias -g S='~/dev/server/'
alias -g AP='~/dev/server/go/src/dropbox/api_proxy/'
alias -g PROTO='~/dev/server/configs/proto/dropbox/proto/'

# Git aliases
alias -g gst='git status -s'
alias -g gd='git diff'
alias -g gc='git checkout $(git branch --sort=-committerdate | fzf)'
alias -g gs='git show $(git log -50 --pretty=oneline | fzf | cut -d " " -f 1)'
alias -g gp='git pull'
alias -g ga='git add $(git status -s | fzf | cut -d " " -f 2)'

bindkey '^ ' autosuggest-accept

fpath+=${ZDOTDIR:-~}/.zsh_functions

fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
