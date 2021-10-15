script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )"; pwd;)

eval "$(starship init bash)"
source <(kubectl completion bash)
complete -F __start_kubectl k

source ${script_dir}/common.sh
