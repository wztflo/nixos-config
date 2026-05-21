{ ... }:
{
  programs.nixvim = {
    plugins.lspconfig.enable = true;
    lsp.inlayHints.enable = true; # 开启内联提示（如 Rust 的类型推导提示）

    # 仅保留指定的 4 种语言服务器
    lsp.servers = {

      # 1. Nix 语言服务器 (切换为 nixd)
      nixd = {
        enable = true;
      };

      # 2. Rust 语言服务器

      rust_analyzer = {
        enable = true;
        packageFallback = true;
        config = {
          settings = {
            rust-analyzer = {
              check = {
                command = "clippy";
                onSave = true;
              };
              inlayHints = {
                enable = true;
                typeHints.enable = true;
                parameterHints.enable = true;
                chainingHints.enable = true;
              };
            };
          };
        };
      };

      # 3. Python 语言服务器
      basedpyright = {
        enable = true;
        packageFallback = true;
        config = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "standard";
                autoSearchPaths = true;
                useLibraryCodeForTypes = true;
                diagnosticMode = "openFilesOnly";
              };
            };
          };
        };
      };

      # 4. Lua 语言服务器
      lua_ls = {
        enable = true;
        config = {
          settings = {
            Lua = {
              diagnostics.globals = [ "vim" ]; # 消除找不到全局变量 vim 的警告
              hint = {
                enable = false;
              };
            };
          };
        };
      };
    };

    # 核心快捷键绑定
    keymaps = [
      {
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<cr>";
        options.desc = "显示悬浮文档";
      }
      {
        key = "<leader>D";
        action = "<cmd>lua vim.diagnostic.open_float()<cr>";
        options.desc = "显示诊断信息 (浮窗)";
      }
      {

        key = "[d";
        action = "<cmd>lua vim.diagnostic.jump({ count=-1, float=true })<cr>";
        options.desc = "跳转到上一个诊断";
      }
      {
        key = "]d";
        action = "<cmd>lua vim.diagnostic.jump({ count=1, float=true })<cr>";
        options.desc = "跳转到下一个诊断";
      }
      {
        key = "<leader>cR";
        action = "<cmd>lua vim.lsp.buf.rename()<cr>";
        options.desc = "重命名符号";
      }
      {
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
        options.desc = "代码操作";
      }
      {
        key = "gD";
        action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
        options.desc = "跳转到声明";
      }
      {
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<cr>";
        options.desc = "跳转到定义";
      }
      {
        key = "gi";
        action = "<cmd>lua vim.lsp.buf.implementation()<cr>";
        options.desc = "查找实现";
      }
      {
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<cr>";
        options.desc = "查找引用";
      }

      {
        key = "gt";
        action = "<cmd>lua vim.lsp.buf.type_definition()<cr>";
        options.desc = "跳转到类型定义";
      }
    ];

    # 诊断信息的样式优化
    extraConfigLua = ''
      vim.api.nvim_create_autocmd('LspAttach', {

        callback = function()

          local _border = "rounded"
          vim.diagnostic.config({
            virtual_text = true, -- 在行尾显示诊断文字
            signs = {
              active = true,
              text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN]  = "",
                [vim.diagnostic.severity.INFO]  = "",
                [vim.diagnostic.severity.HINT]  = "💡",
              },
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
              border = _border,
            },
          })
        end,
      })
    '';
  };
}
