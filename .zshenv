# Ryan Eloff

# bin: set PATH to include user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# .local/bin: set PATH to include user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# pyenv: set PATH to include pyenv if it exists
if [ -d "$HOME/.pyenv/bin" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

# pyenv: enable shims and autocompletion
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# pyenv-virtualenv: enable auto-activation of virtualenvs
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)"
fi

# python poetry: set PATH to include poetry if it exists
if [ -d "$HOME/.poetry/bin" ] ; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi
