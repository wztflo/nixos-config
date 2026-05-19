{ pkgs, inputs, lib, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  home.username = "wztflo";
  home.homeDirectory = "/home/wztflo";
  home.stateVersion = "26.05";

  xdg.enable = true;

  programs = {
    home-manager.enable = true;
    fish.enable = true;
    starship.enable = true;

    gh = {
      enable = true;
      settings = {
        git_protocol = "https";
      };
    };

    # Git 配置
    git = {
      enable = true;
      settings = {
        user = {
          name = "wztflo";
          email = "210134871+wztflo@users.noreply.github.com";
        };
        safe.directory = "/etc/nixos";
      };
    };

    # 单独启用的工具
    ripgrep.enable = true;
    fd.enable = true;
    neovim.enable = true;
    fastfetch.enable = true;
    bottom.enable = true;

  } // (lib.genAttrs [ "zoxide" "yazi" "eza" "fzf" ] (name: {
    # 批量合并需要开启 fish 集成的工具
    enable = true;
    enableFishIntegration = true;
  }));

  # Catppuccin 主题配置
  catppuccin = {
    flavor = "mocha";
    fish.enable = true;
    starship.enable = true;
    yazi.enable = true;
    eza.enable = true;
    fzf.enable = true;
    bottom.enable = true;
  };

  # 其他纯软件包
  home.packages = with pkgs; [
    nano
    wget
    curl
    python3
  ];
}
