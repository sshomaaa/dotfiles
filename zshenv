## zshenv

##################################################
# Binary manager
##################################################
# goenv
if [ -d $HOME/.goenv ]; then
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$GOENV_ROOT/bin:$PATH"
fi
if type "goenv" >/dev/null 2>&1; then
    eval "$(goenv init -)"
    export PATH="$GOROOT/bin:$PATH"
    export PATH="$PATH:$GOPATH/bin"
fi