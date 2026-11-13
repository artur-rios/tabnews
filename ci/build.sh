#!/bin/sh
# The `build` check: installs the locked dependencies and makes the production build with `next build` (the
# package has no build script and no tests). Nothing is deployed: the point is that the site still builds.
# yggdrasil.yml runs it in the pinned Node image (.nvmrc's lts/hydrogen, Alpine: no bash, so this is POSIX sh)
# from the repository's root. By hand, from anywhere in the checkout:
#   docker run --rm -v "$PWD:/src" -w /src <image> sh ci/build.sh
set -eu

# The repository's root, wherever this is run from.
cd "$(dirname "$0")/.."

export NEXT_TELEMETRY_DISABLED=1

npm ci --no-audit --no-fund
npx --no-install next build
