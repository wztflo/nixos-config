{ ... }:
{
  imports = [
    ./blink.nix
    ./conform.nix
  ];

  programs.nixvim.plugins = {
    # ---- 核心 LSP 控制中心 ----
    lsp = {
      enable = true;

      # 🌟 统一配置 LSP 常用快捷键（仅在 LSP 激活的 buffer 中生效）
      keymaps = {
        silent = true;
        lspBuf = {
          gd = "definition"; # 跳转到定义
          gD = "declaration"; # 跳转到声明
          gi = "implementation"; # 跳转到实现
          gt = "type_definition"; # 跳转到类型定义
          K = "hover"; # 显示悬浮提示（文档）
          "<leader>rn" = "rename"; # 变量重命名
          "<leader>ca" = "code_action"; # 代码修复/动作
        };
        diagnostic = {
          "[d" = "goto_prev"; # 跳转到上一个报错/警告
          "]d" = "goto_next"; # 跳转到下一个报错/警告
          "<leader>do" = "open_float"; # 浮窗显示当前行详细报错
        };
      };

      # 🌟 开启你需要的语言服务器 (Language Servers)
      servers = {
        # 1. Nix 配置语言
        nixd.enable = true;

        # 2. Rust
        rust_analyzer = {
          enable = true;
          installCargo = false; # 依赖系统/项目自带的 cargo
          installRustc = false;
        };

        # 3. Python
        pyright.enable = true;

        # 4. JavaScript / TypeScript
        ts_ls.enable = true; # (原 tsserver)

        # 5. Lua
        lua_ls.enable = true;

        # 6. TOML
        taplo.enable = true;
      };
    };
  };
}
