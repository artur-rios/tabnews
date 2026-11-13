#!/bin/sh
# The `lint` check: installs the locked dependencies and runs the repository's own `lint:check` script
# (prettier --check ., which reads .prettierignore and .editorconfig). Static checks only, nothing is built.
# yggdrasil.yml runs it in the pinned Node image (.nvmrc's lts/hydrogen, Alpine: no bash, so this is POSIX sh)
# from the repository's root. By hand, from anywhere in the checkout:
#   docker run --rm -v "$PWD:/src" -w /src <image> sh ci/lint.sh
set -eu

# The repository's root, wherever this is run from.
cd "$(dirname "$0")/.."

npm ci --no-audit --no-fund
npm run lint:check
