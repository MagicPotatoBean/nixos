with import <nixpkgs> {};
  writeShellScriptBin "edit" ''
     # !/usr/bin/env bash

     # Fetch latest changes from github
    git fetch
    git pull

     # Open neovim in ~/.dotfiles/nixos/
    nvim /home/zoe/.dotfiles/nixos/
  ''
