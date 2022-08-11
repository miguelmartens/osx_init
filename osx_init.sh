#!/bin/bash

TAP=(
    azure/bicep
)

FORMULAE=(
    azcopy
    azure-cli
    Azure/kubelogin/kubelogin
    bash
    bicep
    calicoctl
    git
    #helm
    jq
    krew
    kubectx
    kubernetes-cli
    lynx
    markdown
    nmap
    node
    npm
    powerlevel10k
    pyenv
    python
    svn
    terraform
    thefuck
    virtualenv
    virtualenvwrapper
    w3m
    watch
    tree
    vim
    wget
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
)

CASKS=(
    appcleaner
    azure-data-studio
    balenaetcher
    bitwarden
    cyberduck
    discord
    #docker
    drawio
    google-chrome
    google-drive
    iterm2
    lens
    microsoft-azure-storage-explorer
    microsoft-remote-desktop
    mono-mdk-for-visual-studio
    oracle-jdk
    postman
    powershell
    #rancher
    slack
    spotify
    tableplus
    the-unarchiver
    visual-studio
    visual-studio-code
    vlc
    whatsapp
    wireshark
)

FONTS=(
    font-hack-nerd-font
)

PYTHON_PACKAGES=(
    virtualenv
    virtualenvwrapper
)

echo "INIT OSX..."

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

echo "Tap..."
brew tap ${TAP[@]}

echo "Installing Formulaes..."
brew install ${FORMULAE[@]}

echo "Installing Casks..."
brew tap homebrew/cask
brew install --cask ${CASKS[@]}

echo "Installing Fonts..."
brew tap homebrew/cask-fonts
brew install --cask ${FONTS[@]}

echo "Installing Python packages..."
#sudo pip install ${PYTHON_PACKAGES[@]}

# echo "Use pyenv to Install Python or Update Your Python Version"
# pyenv install 3.9.2 

echo "Set the latest version of Python to Global Default"
python_version=$(brew info python | awk 'FNR == 1 {print $3}')
pyenv global $python_version
pyenv versions

echo "Installing global npm packages..."
npm i -g typescript
npm i -g yarn

echo "Creating folder structure..."
[[ ! -d ~/Workspace ]] && mkdir ~/Workspace
[[ ! -d ~/Projects ]] && mkdir ~/Projects

echo "INIT complete"
