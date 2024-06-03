with import <nixpkgs> {};
  writeShellScriptBin "edit" ''
     # !/usr/bin/env bash

     # Stop on error
     set -e

    # Navigate to config files
    pushd /etc/nixos/ > /dev/null

     # Fetch latest changes from github
    sudo git fetch
    sudo git pull

     # Open neovim in ~/.dotfiles/nixos/
    sudo nvim /etc/nixos/

    # Return to where you were
    popd > /dev/null
  ''
