# My zshrc
# require font.
# https://github.com/yuru7/HackGen/releases

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt IGNOREEOF

autoload -Uz colors && colors
autoload -Uz compinit && compinit

setopt no_beep
setopt notify

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

# prezto
if [ ! -d ~/.zprezto ]; then
    ( git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto )
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ( ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" )
    done
fi
source ~/.zprezto/init.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz promptinit
promptinit
prompt powerlevel10k

export EDITOR=vim

# sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# alias
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
