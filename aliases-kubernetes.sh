# shellcheck shell=bash

# Setup kubectl completions
if hash kubectl 2>/dev/null;  then
    alias k='kubectl'
    alias kgp='kubectl get pods -o wide'
    alias kgp='kubectl get nodes -o wide'

    # shellcheck source=/dev/null
    source <(kubectl completion bash)
    complete -F __start_kubectl k
fi