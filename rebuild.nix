with import <nixpkgs> {};
  writeShellScriptBin "rebuild" ''
    # !/usr/bin/env bash
    # A rebuild script that commits on a successful build
    set -e

    # cd to your config dir
    pushd ~/.dotfiles/nixos/ > /dev/null

    # Open config in neovim
    nix develop /home/zoe/source/flakes/nvim/nvim/
    nvim /home/zoe/.dotfiles/nixos/configuration.nix

    # Autoformat your nix files
    sudo alejandra . &>/dev/null

    # Shows your changes
    git diff -U0 *.nix

    echo "NixOS Rebuilding..."

    # Rebuild, output simplified errors, log trackebacks
    sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

    # Get current generation metadata
    current=$(nixos-rebuild list-generations | grep current)

    # Commit all changes with the generation metadata, and pushing it
    git commit -am "$current"
    git push

    # Back to where you were
    popd > /dev/null

    # Notify all OK!
    echo -e "NixOS Rebuilt OK!"
  ''
