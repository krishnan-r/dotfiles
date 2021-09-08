#!/bin/bash

set -euxo pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )"; pwd;)"

ln -sf "${script_dir}/vimrc" "${HOME}/.vimrc"

vim_packdir="${HOME}/.vim/pack/dotfiles/start/"
rm -rf "${vim_packdir}"
mkdir -p "${vim_packdir}"

( \
cd "${vim_packdir}" && \
git clone --depth=1 https://github.com/preservim/nerdtree.git && \
git clone --depth=1 https://github.com/vim-airline/vim-airline && \
git clone --depth=1 https://github.com/edkolev/tmuxline.vim \
)
