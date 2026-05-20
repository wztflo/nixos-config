{ ... }: {
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      # 🌟 设置虚线的样式：这里用最经典的细竖线 "│"
      indent = {
        char = "│"; 
      };
      
      scope = {
        enabled = false;
      };

      # 在哪些特殊界面不需要显示对齐线
      exclude = {
        filetypes = [
          "help"
          "yazi"
          "neo-tree"
          "lazy"
          "mason"
        ];
      };
    };
  };
}