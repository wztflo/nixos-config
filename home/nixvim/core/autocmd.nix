{ config, pkgs, ... }:
{
  programs.nixvim.autoCmd = [
    # 1. 复制文本时闪烁高亮（非常直观的视觉反馈）
    {
      event = [ "TextYankPost" ];
      desc = "复制文本时高亮反馈";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank({
              higroup = 'IncSearch',
              timeout = 150,
            })
          end
        '';
      };
    }

    # 2. WSL 剪贴板自动桥接（如果是 WSL 环境则自动生效，非 WSL 不受影响）
    {
      event = [ "VimEnter" ];
      desc = "WSL 剪贴板适配";
      callback = {
        __raw = ''
          function()
            if vim.fn.has('wsl') == 1 then
              vim.g.clipboard = {
                name = 'WslClipboard',
                copy = {
                  ['+'] = 'clip.exe',
                  ['*'] = 'clip.exe',
                },
                paste = {
                  ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw))',
                  ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw))',
                },
                cache_enabled = 0,
              }
            end
          end
        '';
      };
    }
  ];
}
