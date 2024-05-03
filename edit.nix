with import <nixpkgs> {};
  writeShellScriptBin "edit" ''
    # !/usr/bin/env bash
    # Open neovim in ~/.dotfiles/nixos/
    nvim /home/zoe/.dotfiles/nixos/
  ''
