with import <nixpkgs> {};
  writeShellScriptBin "edit" ''
    # !/usr/bin/env bash
    # Open vscode in ~/.dotfiles/nixos/
    code /home/zoe/.dotfiles/nixos/
  ''
