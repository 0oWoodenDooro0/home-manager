{ config, libs, pkgs, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
  });
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true; 
    defaultEditor = true; 
    viAlias = true; 
    vimAlias = true; 
    vimdiffAlias = true; 
  };

  home.file.".config/nvim" = {
    source = ./dotfiles/nvim;
    recursive = true;
  };
}
