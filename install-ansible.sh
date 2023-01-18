#!/bin/bash

if [[ $# != 1 ]]; then
  echo "Missing operating system" > /dev/stderr
  echo "" > /dev/stderr
  echo "Usage: $0 <platform>" > /dev/stderr
  echo "" > /dev/stderr
  echo "Example: $0 mac" > /dev/stderr
  exit 1
fi

if [[ "$1" == "mac" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  arch | grep "arm64" && eval $(/opt/homebrew/bin/brew shellenv) && echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zshrc || echo ""
  python3 -m venv ~/.venv/default
  source ~/.venv/default/bin/activate
  python -m pip install -U pip
  pip install ansible

elif [[ "$1" == "alma" ]]; then
  sudo dnf install -y epel-release
  sudo dnf groupinstall -y "Development tools"
  sudo dnf install -y python39 gcc-c++
  python3 -m venv ~/.venv/default
  source ~/.venv/default/bin/activate
  python -m pip install -U pip
  pip install ansible

else
  echo "Unknown platform $1" > /dev/stderr
  exit 2
fi
