#!/bin/bash

# update apt packages
sudo apt-get -y update --no-install-recommends &&
	sudo apt-get -y upgrade --no-install-recommends &&
	sudo apt-get autoremove -y &&
	sudo apt-get clean -y

# update pip
python -m pip install --no-cache-dir --upgrade pip

# update pdm
pdm self update

# update trunk
trunk upgrade -y
