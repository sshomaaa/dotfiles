# My zshrc

setopt IGNOREEOF

autoload -Uz colors && colors
autoload -Uz compinit && compinit

setopt no_beep
setopt notify
###setopt print_exit_value

# history
setopt share_history
setopt histignorealldups
setopt hist_reduce_blanks
setopt inc_append_history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=500000

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

zstyle ':completion:*' menu select
setopt list_packed
setopt correct
setopt auto_param_keys
setopt magic_equal_subst

setopt no_flow_control

# dircolors-solarized
# https://github.com/seebi/dircolors-solarized
eval `dircolors ~/.dir_colors/dircolors.256dark`

PROMPT='%F{240}[%D %*]%f %F{066}%n@%m%f %B%F{067}%~%f%b
%{%(?.%F{028}.%F{124})%}%#%f '

# zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting.zsh

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

export EDITOR=vim

# sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# nodebrew
if [ -d $HOME/.nodebrew ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

# alias
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'