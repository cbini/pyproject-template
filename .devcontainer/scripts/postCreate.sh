#!/bin/bash

# update/install apt packages
sudo apt-get -y --no-install-recommends update &&
  sudo apt-get -y --no-install-recommends upgrade &&
  sudo apt-get -y --no-install-recommends install bash-completion &&
	sudo rm -rf /var/lib/apt/lists/*

# create env folder
mkdir -p ./env
sudo mkdir -p /etc/secret-volume

# install project dependencies
uv venv
uv sync
