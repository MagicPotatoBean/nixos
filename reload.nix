with import <nixpkgs> {};
  writeShellScriptBin "reload" ''
    # !/usr/bin/env bash
    # A rebuild script
    set -e

    # cd to your config dir
    pushd /etc/nixos/ > /dev/null

    # Fetch latest changes from github repo
    sudo git fetch
    sudo git pull

    # Shows your changes
    git diff -U0 *.nix

    echo "NixOS Rebuilding..."

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

    # Back to where you were
    popd > /dev/null

    # Notify all OK!
    echo -e "NixOS Rebuilt OK!"
  ''
