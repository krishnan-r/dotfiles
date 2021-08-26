script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )"; pwd;)

eval "$(starship init bash)"

source ${script_dir}/common.sh
