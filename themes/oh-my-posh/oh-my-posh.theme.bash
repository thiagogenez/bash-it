# shellcheck shell=bash

if _command_exists oh-my-posh; then
    export POSH_THEME=${POSH_THEME:-https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/v$(oh-my-posh --version)/themes/jandedobbeleer.omp.json}
    
    # if cat command is an alias using pygmentize, oh-my-posh will crash
    # because the time cat from a file will contains hidden colour characteres
    cat_command="cat"
    if alias cat 2>/dev/null; then 
        if command -v /usr/bin/cat; then
            cat_command="\/usr\/bin\/cat"
        elif command -v /bin/cat; then
            cat_command="\/bin\/cat"
        fi
    fi
    eval "$(oh-my-posh --init --shell bash --config "${POSH_THEME}" | sed "s/cat/$cat_command/g")"
else
    _log_warning "The oh-my-posh binary was not found on your PATH. Falling back to your existing PS1, please see the docs for more info."
fi
