with import <nixpkgs> {};
  writeShellScriptBin "gc" ''
    # !/usr/bin/env bash
    # Clear unused packages over a week old
    nix-collect-garbage --delete-older-than 7d
  ''
