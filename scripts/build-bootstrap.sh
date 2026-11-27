#!/usr/bin/env bash
# Builds bootstrap zips for in.termium. Run on a Linux x86_64 machine with Docker (or Ubuntu 22.04+), 50GB free, several hours.
set -euo pipefail
PKG="in.termium"
git clone --depth 1 https://github.com/termux/termux-packages.git tp
cd tp
# Point every build at the new package / prefix (variable name differs by version, patch whichever exists)
grep -rl "com\.termux" scripts/properties.sh scripts/build/*.sh scripts/*.sh 2>/dev/null | xargs sed -i "s#com\.termux#$PKG#g" || true
# Build the bootstrap packages and generate zips for the architectures you need
for ARCH in aarch64 arm; do
  ./scripts/run-docker.sh ./scripts/generate-bootstraps.sh --architectures "$ARCH" || \
  ./scripts/run-docker.sh ./scripts/generate-bootstraps.sh --architectures "$ARCH" --repository "file:///data/data/$PKG/repo"
done
echo "Copy bootstrap-<arch>.zip files to app/src/main/cpp/ of the app project."
