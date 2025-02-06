#!/bin/bash
# setup pyenv and environment
sudo apt update
sudo apt -y install libffi-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev liblzma-dev make build-essential python3-venv python3-pip clang
sudo apt -y upgrade
curl -fsSL https://pyenv.run | bash

if ! $(grep -q PYENV_ROOT ~/.profile);then
    echo "appending PYENV setting to ~/.profile"
    cat >> ~/.profile <<-"EOF"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
EOF
fi

source ~/.profile
CC=clang pyenv install 3.7.3
pyenv shell 3.7.3
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

