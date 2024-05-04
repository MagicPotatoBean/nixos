with import <nixpkgs> {};
  writeShellScriptBin "edit" ''
     # !/usr/bin/env bash
     # Open neovim in ~/.dotfiles/nixos/
    nix develop /home/zoe/source/flakes/nvim/nvim/
    nvim /home/zoe/.dotfiles/nixos/
  ''
