with import <nixpkgs> {};
  writeShellScriptBin "rebuild" ''
    # !/usr/bin/env bash
    # A rebuild script that commits on a successful build
    set -e

    # cd to your config dir
    pushd /etc/nixos/ > /dev/null

    # Fetch latest changes from github repo
    sudo git fetch
    sudo git pull

    # Open config in neovim
    sudo nvim /etc/nixos/configuration.nix /etc/nixos/flake.nix

    # Autoformat your nix files
    sudo alejandra . &>/dev/null

    # Shows your changes
    git diff -U0 *.nix

    echo "NixOS Rebuilding..."

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch --impure &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

    # Get current generation metadata
    current=$(nixos-rebuild list-generations | grep current)

    # Commit all changes with the generation metadata, and pushing it
    sudo git commit -am "$current"
    sudo git push

    # Leave nix develop

    # Back to where you were
    popd > /dev/null

    # Notify all OK!
    echo -e "NixOS Rebuilt OK!"
  ''
