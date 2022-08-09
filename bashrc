# shellcheck shell=bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" || exit; pwd;)"

# Setup shell prompt
if hash starship 2>/dev/null;  then
    export STARSHIP_CONFIG=${script_dir}/starship.config.toml
    eval "$(starship init bash)"
fi

# Setup direnv
if hash direnv 2>/dev/null;  then
    eval "$(direnv hook bash)"
fi

# Aliases
alias la='ls -al'
# shellcheck source=/dev/null
source "${script_dir}/aliases-kubernetes.sh"

