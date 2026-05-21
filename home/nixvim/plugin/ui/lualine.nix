{ ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true; # 开启全局状态栏（多个窗口共享同一个底部状态栏）
      };
    };
  };
}
