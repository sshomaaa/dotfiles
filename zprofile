## zprofile

##################################################
# Binary manager
##################################################
# pyenv
if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi
if type "pyenv" >/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi