##
## My zshrc
##

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

##################################################
# Environment variable
##################################################
if [ $(type nvim > /dev/null; echo $?) = 0 ]; then
    export EDITOR=nvim
elif [ $(type vim > /dev/null; echo $?) = 0 ]; then
    export EDITOR=vim
fi

##################################################
# Plugin
##################################################
# zplug
# https://github.com/zplug/zplug
ZPLUG_HOME=~/.zplug
if [ ! -d $ZPLUG_HOME ]; then
    ( git clone https://github.com/zplug/zplug $ZPLUG_HOME )
fi
[[ -f ~/.zplug/init.zsh ]] && source ~/.zplug/init.zsh

# powerlevel10k
# https://github.com/romkatv/powerlevel10k
zplug "romkatv/powerlevel10k", as:theme, depth:1

# cd-gitroot
# https://github.com/mollifier/cd-gitroot
zplug "mollifier/cd-gitroot"

# enhancd
# https://github.com/b4b4r07/enhancd
zplug "b4b4r07/enhancd", use:init.sh

# zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# zsh-completions
# https://github.com/zsh-users/zsh-completions
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
    zplug install
fi
zplug load

# powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autojump
# https://github.com/wting/autojump
if [ ! -d ~/.autojump ]; then
    ( git clone git://github.com/wting/autojump.git /tmp/autojump && cd /tmp/autojump && SHELL=$(which zsh) python3 ./install.py && cd ~ && rm -rf /tmp/autojump )
fi
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

# dircolors-solarized
# https://github.com/seebi/dircolors-solarized
# if [ "$(which dircolors)" != "" ]; then
#     if [ ! -d ~/.dircolors-solarized ]; then
#         ( git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors-solarized )
#     fi
#     eval `dircolors ~/.dircolors-solarized/dircolors.256dark`
# fi

# sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

##################################################
# Binary manager
##################################################
# nodebrew
if [ -d $HOME/.nodebrew ]; then
    export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

# pyenv
if type "pyenv" >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# rbenv
if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
fi
if type "rbenv" >/dev/null 2>&1; then
    eval "$(rbenv init - zsh)"
fi

# plenv
if [ -d $HOME/.plenv ]; then
    export PATH="$HOME/.plenv/bin:$PATH"
fi
if type "plenv" >/dev/null 2>&1; then
    eval "$(plenv init - zsh)"
fi

##################################################
# Path
##################################################
# yarn
# https://classic.yarnpkg.com/en/docs/install#debian-stable
if [ -d ~/.yarn ]; then
    export PATH=~/.yarn/bin:~/.config/yarn/global/node_modules/.bin:$PATH
fi

##################################################
# WSL
##################################################
if [ "$(uname -r | grep "microsoft")" != "" ]; then
    if [ "$(awk -F= '$1=="NAME" { print $2; }' /etc/os-release | xargs echo)" = "Ubuntu" ]; then
        # DISPLAY
        # With manually configuring resolv.conf
        export DISPLAY=$(ip r | grep "default via" | awk '{print $3}'):0

        # IM
        export GTK_IM_MODULE=fcitx
        export QT_IM_MODULE=fcitx
        export XMODIFIERS=@im=fcitx
        export DefaultIMModule=fcitx
    fi
fi

##################################################
# Alias
##################################################
if [ "$(uname)" = "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias llh='ls -lh'
