#!/bin/bash

# update pip
sudo python -m pip install --no-cache-dir --upgrade pip

# update pdm
uv self update

# update trunk
trunk upgrade -y --no-progress
