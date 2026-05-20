{ ... }: {
  programs.nixvim = {
    #  必须加上这两个基础的 Vim 原生选项，UFO 插件才能接管系统折叠
    opts = {
      foldcolumn = "1"; # 在最左侧显示一条极简的折叠指示线
      foldlevel = 99;   # 默认打开文件时不折叠任何代码
      foldlevelstart = 99;
      foldenable = true;
    };

    plugins.nvim-ufo = {
      enable = true;
      setupLspCapabilities = true;
      
      lazyLoad = {
        enable = true;
        settings = {
          event = [ "BufReadPost" "BufNewFile" ];
        };
      };

      settings = {
        provider_selector = ''
          function(bufnr, filetype, buftype)
            return { "treesitter", "indent" }
          end
        '';

        # 华丽的行数后缀提示
        fold_virt_text_handler = ''
          function(virtText, lnum, endLnum, width, truncate)
              local newVirtText = {}
              local suffix = (" 󰁂 %d 行被隐藏 "):format(endLnum - lnum)
              local sufWidth = vim.fn.strdisplaywidth(suffix)
              local targetWidth = width - sufWidth
              local curWidth = 0

              for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                  table.insert(newVirtText, chunk)
                else
                  chunkText = truncate(chunkText, targetWidth - curWidth)
                  local hlGroup = chunk[2]
                  table.insert(newVirtText, { chunkText, hlGroup })
                  chunkWidth = vim.fn.strdisplaywidth(chunkText)
                  if curWidth + chunkWidth < targetWidth then
                    suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                  end
                  break
                end
                curWidth = curWidth + chunkWidth
              end

              table.insert(newVirtText, { suffix, "Comment" })
              return newVirtText
          end
        '';
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "zR";
        action.__raw = "function() require('ufo').openAllFolds() end";
        options = { silent = true; desc = "打开全部代码"; };
      }
      {
        mode = "n";
        key = "zM";
        action.__raw = "function() require('ufo').closeAllFolds() end";
        options = { silent = true; desc = "折叠全部代码"; };
      }
      {
        mode = "n";
        key = "K";
        action.__raw = ''
          function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
              vim.lsp.buf.hover()
            end
          end
        '';
        options = { silent = true; desc = "查看折叠代码/LSP文档"; };
      }
    ];
  };
}