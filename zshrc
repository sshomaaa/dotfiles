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

# homebrew paths(for Darwin)
if [ "`uname`" = "Darwin" ]; then
    # coreutils
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

    # findutils
    export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

    # gnu-sed
    export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

    # grep
    export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

    # mysql-client
    export PATH="/usr/local/opt/mysql-client/bin:$PATH"
    #export LDFLAGS="-L/usr/local/opt/mysql-client/lib"
    #export CPPFLAGS="-I/usr/local/opt/mysql-client/include"
    #export PKG_CONFIG_PATH="/usr/local/opt/mysql-client/lib/pkgconfig"

    # ncurses
    export PATH="/usr/local/opt/ncurses/bin:$PATH"
    #export LDFLAGS="-L/usr/local/opt/ncurses/lib"
    #export CPPFLAGS="-I/usr/local/opt/ncurses/include"
    #export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

    # readline
    #export LDFLAGS="-L/usr/local/opt/readline/lib"
    #export CPPFLAGS="-I/usr/local/opt/readline/include"
    #export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

    # sqlite
    export PATH="/usr/local/opt/sqlite/bin:$PATH"
    #export LDFLAGS="-L/usr/local/opt/sqlite/lib"
    #export CPPFLAGS="-I/usr/local/opt/sqlite/include"
    #export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"

    # unzip
    export PATH="/usr/local/opt/unzip/bin:$PATH"
fi

# nodebrew
if [ -d $HOME/.nodebrew ]; then
    export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# yarn
if [ -d $HOME/.yarn ]; then
    export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
fi

# pyenv
if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

# goenv
if [ -d $HOME/.goenv ]; then
    export GOENV_ROOT=$HOME/.goenv
    export PATH=$GOENV_ROOT/bin:$PATH
    eval "$(goenv init -)"
fi

# rbenv
if [ -d $HOME/.rbenv ]; then
    export RBENV_ROOT=$HOME/.rbenv
    export PATH=$RBENV_ROOT/bin:$PATH
    eval "$(rbenv init -)"
fi

# dircolors-solarized
# https://github.com/seebi/dircolors-solarized
if [ ! -f ~/.dir_colors/dircolors-solarized/dircolors.256dark ]; then
    mkdir -p ~/.dir_colors
    ( cd ~/.dir_colors && git clone https://github.com/seebi/dircolors-solarized.git )
fi
eval `dircolors ~/.dir_colors/dircolors-solarized/dircolors.256dark`

PROMPT='%F{247}[%D %*]%f %F{066}%n@%m%f %B%F{067}%~%f%b
%{%(?.%F{028}.%F{124})%}%#%f '

# zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
if [ ! -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    mkdir -p ~/.zsh
    ( cd ~/.zsh && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git )
fi
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias
alias ls='ls --color=auto'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
