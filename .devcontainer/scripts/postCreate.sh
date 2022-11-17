#!/bin/bash

# update apt packages
sudo apt-get -y update --no-install-recommends &&	
	sudo apt-get -y install --no-install-recommends bash-completion &&
	sudo apt-get -y upgrade --no-install-recommends &&
	sudo apt-get autoremove -y &&
	sudo apt-get clean -y

# update pip
pip install --no-cache-dir --upgrade pip

# create .gitignore
function gi() {
	curl -sL "https://www.toptal.com/developers/gitignore/api/${1}"
}
gi linux,macos,windows,python >.gitignore

# commit new files
git add .
git commit -m "Initial devcontainer commit"

# install pdm dependencies
pdm install

# install/init trunk, accept defaults
curl https://get.trunk.io -fsSL | bash -s -- -y
trunk init --yes-to-all --nocheck-sample

# commit new files
git add .
git commit -m "Initial PDM & Trunk commit"
