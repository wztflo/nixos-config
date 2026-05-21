{ ... }:
{
  plugins.nvim-autopairs = {
    enable = true;

    settings = {
      check_ts = true; # 联动 Treesitter！在写 Markdown 代码块或特定语法时更智能
      disable_filetype = [
        "TelescopePrompt"
        "spectre_panel"
      ];
    };

    lazyLoad = {
      enable = true;
      settings = {
        event = [ "InsertEnter" ];
      };
    };
  };
}
