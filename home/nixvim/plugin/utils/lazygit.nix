{ pkgs, ... }:
{

  plugins.lazygit = {
    enable = true;

    lazyLoad = {
      enable = true;
      settings = {
        cmd = "LazyGit";
        keys = [ "<leader>gg" ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";

      action = "<cmd>LazyGit<CR>";
      options = {

        silent = true;
        desc = "一键打开弹窗 Lazygit";
      };
    }
  ];

}
