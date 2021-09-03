#!/bin/bash

set -euxo pipefail

vim_packdir="${HOME}/.vim/pack/dotfiles/start/"
rm -rf "${vim_packdir}"
mkdir -p "${vim_packdir}"

( \
cd "${vim_packdir}" && \
git clone --depth=1 https://github.com/preservim/nerdtree.git && \
git clone --depth=1 https://github.com/vim-airline/vim-airline \
)
