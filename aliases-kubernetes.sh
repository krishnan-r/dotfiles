# Setup kubectl completions
if hash kubectl 2>/dev/null;  then
    alias k='kubectl'
    alias kgp='kubectl get pods -o wide'
    alias kgp='kubectl get nodes -o wide'

    source <(kubectl completion bash)
    source <(kubectl completion bash | sed 's/kubectl/k/g')
    complete -F __start_kubectl k
fi