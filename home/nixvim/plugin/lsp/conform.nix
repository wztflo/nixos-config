{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      nixfmt
      stylua
      prettierd
    ];

    plugins.conform-nvim = {
      enable = true;

      settings = {
        # 1. 按文件类型（Filetype）指定格式化工具
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          lua = [ "stylua" ];
          markdown = [ "prettierd" ];
          json = [ "prettierd" ];
          yaml = [ "prettierd" ];
          # 你可以用 [ "stop_after_first" ] 语法让它在多个工具中选第一个可用的
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_last_lines"
          ]; # 通用兜底规则：去除多余空行和末尾空格
        };

        # 2. 🌟 核心功能：保存文件时自动格式化
        format_on_save = {
          timeout_ms = 600; # 格式化超时时间（毫秒）
          lsp_fallback = true; # 如果没有可用的格式化器，使用 LSP 格式化
        };
      };
    };

    # 3. 绑定一个手动格式化的快捷键：按下 <leader>f 也能强制格式化
    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action.__raw = ''
          function()
            require("conform").format({ async = true, lsp_fallback = true })
          end
        '';
        options = {
          silent = true;
          desc = "代码格式化";
        };
      }
    ];
  };
}
