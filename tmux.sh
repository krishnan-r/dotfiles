#!/bin/bash

set -euxo pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )"; pwd;)"

ln -sf "${script_dir}/tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${script_dir}/tmuxline-snapshot" "${HOME}/.tmuxline-snapshot"

