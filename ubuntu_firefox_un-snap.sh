#!/bin/bash

# This is Ubuntu script for removing firefox as snap and installing it as .deb
# 
# 1. Uninstall the Firefox Snap:
sudo snap remove firefox
# 2. Create an APT keyring (if one doesn’t already exist):
sudo install -d -m 0755 /etc/apt/keyrings
# 3. Import the Mozilla APT repo signing key (if wget is missing, install it first):
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
# 4. Add the Mozilla signing key to your sources.list
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
# 5. Set the Firefox package priority to ensure Mozilla’s .deb is always preferred
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000

Package: firefox*
Pin: release o=Ubuntu
Pin-Priority: -1' | sudo tee /etc/apt/preferences.d/mozilla
# 6. Use APT to remove Ubuntu’s pretend Firefox DEB (if still present) and install the real-deal from Mozilla’s repository:
sudo apt update && sudo apt remove firefox
sudo apt install firefox firefox-l10n-ru
