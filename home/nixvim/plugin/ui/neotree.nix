{ ... }: {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      settings = {
        enable_git_status = true;
        enable_refresh_on_write = true;
        close_if_last_window = true;
        
        filesystem = {
          hijack_netrw_behavior = "open_default"; 
        };

        window = {
          width = 30;
          position = "left";
          mappings = {
            "h" = "toggle_node";
            "l" = "open";
          };
        };
      };
    };

    # 绑定快捷键：按下键盘上的 <leader>e 就能一键开关左侧文件树
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options = {
          silent = true;
          desc = "切换侧边栏文件树";
        };
      }
    ];

    plugins.neo-tree.lazyLoad = {
      enable = true;
      settings = {
        # 两种情况唤醒它：
        # 1. 触发了 NeoTreeStartEvent（比如系统发现你在打开文件夹）
        # 2. 你手动敲了快捷键（cmd = "Neotree"）
        event = [ "BufEnter" ];
        cmd = "Neotree";
      };
    };
  };
}