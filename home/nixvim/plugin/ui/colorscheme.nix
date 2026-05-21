{ ... }:
{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha"; # 可选 latte, frappe, macchiato, mocha
      # transparent_background = true; # 开启背景透明（完美适配你的桌面壁纸/毛玻璃效果）
      integrations = {
        bufferline = true;
        lualine = true;
        # gitsigns = true;
        neotree = true;
        treesitter = true;
        notify = true;
      };
    };
  };
}
