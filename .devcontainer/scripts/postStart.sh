#!/bin/bash

# update image
printf "Updating apt packages:\n"
sudo apt-get -y update --no-install-recommends &&
	sudo apt-get -y upgrade --no-install-recommends &&
	sudo apt-get autoremove -y &&
	sudo apt-get clean -y
echo

# update pip
printf "Updating pip:\n"
python -m pip install --no-cache-dir --upgrade pip
echo

# update pdm
printf "Updating PDM:\n"
pdm self update
echo

# update trunk
printf "Updating Trunk:\n"
trunk upgrade -y
echo

# completions
eval "$(pdm completion)"
eval "$(pip completion --bash)"
