#!/usr/bin/env bash

set -xe

if command -v apt-get &> /dev/null; then
  sudo apt-get install python3-launchpadlib
  sudo apt-get update
  sudo apt-get install -y xvfb libnvidia-egl-wayland1 mesa-utils libgl1-mesa-dri
fi

if ! test "$HARBOR_CROSS_COMPILING" && test "$(uname -s)" = "Linux"; then
  if test -d "$HOME/.mozbuild/clang/bin"; then
      export CC="$HOME/.mozbuild/clang/bin/clang"
      export CXX="$HOME/.mozbuild/clang/bin/clang++"
  else
      export CC=clang
      export CXX=clang++
  fi
fi

mkdir -p ~/.harbor-keys
if test "$HARBOR_SAFEBROWSING_API_KEY"; then
  echo "$HARBOR_SAFEBROWSING_API_KEY" > ~/.harbor-keys/safebrowsing.dat
fi

if test "$HARBOR_MOZILLA_API_KEY"; then
  echo "$HARBOR_MOZILLA_API_KEY" > ~/.harbor-keys/mozilla.dat
fi

if test "$HARBOR_GOOGLE_LOCATION_SERVICE_API_KEY"; then
  echo "$HARBOR_GOOGLE_LOCATION_SERVICE_API_KEY" > ~/.harbor-keys/google_location_service.dat
fi

. $HOME/.cargo/env

bash ./scripts/mar_sign.sh -i

ulimit -n 4096

if command -v Xvfb &> /dev/null; then
  if ! test "$HARBOR_CROSS_COMPILING"; then
    Xvfb :2 -nolisten tcp -noreset -screen 0 1024x768x24 &
    export LLVM_PROFDATA=$HOME/.mozbuild/clang/bin/llvm-profdata
    export DISPLAY=:2
  fi
  export HARBOR_RELEASE=1
  npm run build
else
  echo "Xvfb could not be found, running without it"
  echo "ASSUMING YOU ARE RUNNING THIS ON MACOS"

  set -v
  export HARBOR_RELEASE=1
  npm run build
fi

echo "Build complete, removing API keys"
rm -rf ~/.harbor-keys
