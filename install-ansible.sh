#!/bin/bash

if [[ $# != 1 ]]; then
  echo "Missing operating system" > /dev/stderr
  echo "" > /dev/stderr
  echo "Usage: $0 <platform>" > /dev/stderr
  echo "" > /dev/stderr
  echo "Example: $0 mac" > /dev/stderr
  exit 1
fi

python_version="python3" # Will download latest python3.*
venv="venv"

case "$1" in
  mac)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    arch | grep "arm64" && eval "$(/opt/homebrew/bin/brew shellenv)" && echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zshrc
    ;;
  redhat)
    sudo dnf groupinstall -y "Development tools"
    sudo dnf install -y "$python_version" "gcc-c++"
    ;;
  debian)
    sudo apt install -y "$python_version" "$python_version-venv"
    ;;
  *)
    >&2 echo "Unknown platform $platform"
    exit 2
    ;;
esac

python3 -m venv $venv
source $venv/bin/activate
python -m pip install -U pip
pip install ansible-core
