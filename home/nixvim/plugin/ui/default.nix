{ ... }: {
  programs.nixvim = {
    # 🌟 开启 Catppuccin 配色，它会自动适配下面的 lualine 和 bufferline
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha"; # 可选 latte, frappe, macchiato, mocha
        # transparent_background = true; # 开启背景透明（完美适配你的桌面壁纸/毛玻璃效果）
        integrations = {
          bufferline = true;
          lualine = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
          notify = true;
        };
      };
    };

    plugins = {
      web-devicons.enable = true;
      # ---- 1. Lualine 状态栏 ----
      lualine = {
        enable = true;
        settings = {
          options = {
            globalstatus = true; # 开启全局状态栏（多个窗口共享同一个底部状态栏）
          };
        };
      };

      # ---- 2. Bufferline 顶栏标签页 ----
      bufferline = {
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

      # ---- 3. Yazi 文件管理器集成 ----
      yazi = {
        enable = true;
        settings = {
          open_for_directories = true; # 当用 nvim 打开一个文件夹时，自动唤起 yazi
          use_ya_for_events_reading = true; # 优化事件读取
        };
      };
    };

    # ---- 4. 为 Yazi 配置快捷键 ----
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Yazi<CR>";
        options.desc = "打开 Yazi 文件管理器";
      }
      # 顺便加两个方便切换标签页（Buffer）的快捷键
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
  };
}