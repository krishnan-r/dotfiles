#!/usr/bin/env bash
set -euxo pipefail
shellcheck lint.sh
shellcheck bashrc
shellcheck vim.sh
shellcheck aliases-kubernetes.sh