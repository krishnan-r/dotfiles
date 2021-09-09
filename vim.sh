#!/bin/bash

set -euo pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )"; pwd;)"

echo "Symlinking ${HOME}/.vimrc"
ln -sf "${script_dir}/vimrc" "${HOME}/.vimrc"



plugins=(
"https://github.com/preservim/nerdtree.git"
"https://github.com/vim-airline/vim-airline"
"https://github.com/edkolev/tmuxline.vim"
"https://github.com/vim-airline/vim-airline-themes.git"
"https://github.com/ryanoasis/vim-devicons"
"https://github.com/tiagofumo/vim-nerdtree-syntax-highlight"
"https://github.com/tomasiser/vim-code-dark"
)

install_plugins() {
  vim_packdir="${HOME}/.vim/pack/dotfiles/start/"
  mkdir -p "${vim_packdir}"
  pushd "${vim_packdir}";

  # Pull repositories already cloned
  for f in *; do
    if [ -d "$f" ]; then
	pushd "${f}";
        echo "Pulling from $f" &
	git pull || true &
	popd;
    fi
  done
  # Clone any new repositories
  for plugin in "${plugins[@]}"; do
    git clone -- "${plugin}" || echo "Skipping ${plugin}" &
  done
  wait
  popd;
  vim -c 'helptags ALL' -c 'q'
}

install_plugins
