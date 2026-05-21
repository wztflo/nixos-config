{ ... }:
{
  plugins.yazi = {
    enable = true;
    settings = {
      open_for_directories = true; # 当用 nvim 打开一个文件夹时，自动唤起 yazi
      use_ya_for_events_reading = true; # 优化事件读取
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ra";
      action = "<cmd>Yazi<CR>";
      options.desc = "打开 Yazi 文件管理器";
    }
  ];
}
