{ ... }: {
  programs.nixvim = {
    # 1. 启用并配置 noice
    plugins.noice = {
      enable = true;
      
      lazyLoad = {
        enable = true;
        settings = {
          event = [ "DeferredUIEnter" "BufReadPost" ];
        };
      };

      settings = {
        notify = {
          enabled = true;
          view = "notify"; # 接管路由
        };
        
        lsp = {
          signature.enabled = false;
          progress.enabled = false;
          hover.enabled = false;
        };

        # 顺手把好看的居中命令行也带上
        cmdline = {
          enabled = true;
          view = "cmdline_popup";
        };
      };
    };

    # 2. 启用并配置负责颜值渲染的 notify
    plugins.notify = {
      enable = true;
      
      # 🌟 修复：采用和 noice 一致的触发时机，防止两者脱节
      lazyLoad = {
        enable = true;
        settings = {
          event = [ "DeferredUIEnter" "BufReadPost" ];
        };
      };

      settings = {
        timeout = 2000;
        background_colour = "#000000";
      };
    };
  };
}