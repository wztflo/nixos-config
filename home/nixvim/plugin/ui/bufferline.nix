{ ... }:
{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        diagnostics = "nvim_lsp"; # 在标签页上直接显示 LSP 错误/警告图标
        show_bufferline = "auto";
        offsets = [
          {
            filetype = "yazi";
            text = "Yazi Manager";
            text_align = "left";
            separator = true;
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<S-h>"; # Shift + h
      action = "<cmd>BufferLineCyclePrev<CR>";
      options.desc = "切换到上一个标签页";
    }
    {
      mode = "n";
      key = "<S-l>"; # Shift + l
      action = "<cmd>BufferLineCycleNext<CR>";
      options.desc = "切换到下一个标签页";
    }
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLinePick<CR>";
      options.desc = "交互式挑选标签页";
    }
    {
      mode = "n";
      key = "<leader>bc";
      action = "<cmd>bdelete<CR>";
      options.desc = "关闭当前标签页";
    }
  ];
}
