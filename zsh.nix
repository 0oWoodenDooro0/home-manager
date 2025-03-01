{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
#    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

#    initExtra = ''
#      export LC_ALL=C.UTF-8
#      export LANG=C.UTF-8
#      export LC_TYPE=C.UTF-8
#    '';

    antidote = {
      enable = true;
      plugins = [
        "jeffreytse/zsh-vi-mode"
      ];
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "sudo"
        "z"
      ];
    };
  };
}
