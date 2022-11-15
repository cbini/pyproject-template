# update image
sudo apt-get -y update --no-install-recommends \
  && sudo apt-get -y upgrade --no-install-recommends \
  && sudo apt-get autoremove -y \
  && sudo apt-get clean -y

# update pip
pip install --no-cache-dir --upgrade pip

# create .gitignore
function gi() {
	curl -sL https://www.toptal.com/developers/gitignore/api/\$@
}
gi linux,macos,windows,python >.gitignore

# commit new files
git add .
git commit -m "Initial commit"

# install/init trunk, accept defaults
curl https://get.trunk.io -fsSL | bash
trunk init --yes-to-all --nocheck-sample
trunk check --all --fix

# commit Trunk auto-corrected files
git add .
git commit -m "Trunk auto-fixes"
