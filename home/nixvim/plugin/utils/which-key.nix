{
  plugins.which-key = {
    enable = true;

    settings = {
      # 保持你的圆角 UI 风格
      win.border = "rounded";
      preset = "helix";

      spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "文件查找";
          icon = "󰈞";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "LSP操作";
          icon = "";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "调试";
          icon = "";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
          icon = "";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "终端操作";
          icon = "";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "缓冲区操作";
          icon = "";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>w";
          group = "窗口移动";
          icon = "";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>e";
          group = "Neotree";
          icon = "";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>D";
          group = "诊断浮窗";
          icon = "";
          mode = "n";
        }
        {
          __unkeyed-1 = "<leader>q";
          group = "退出编辑器";
          icon = "󰩈";
          mode = "n";
        }
      ];
    };
  };

  # 配合 Telescope 做全局快捷键搜索
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "搜索所有快捷键";
      };
    };
  };
}
