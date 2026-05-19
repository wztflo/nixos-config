{ ... }:

{
  catppuccin.ghostty.enable = true;

  xdg.configFile = {
    "ghostty/config".source = ./config.ghostty;
    "ghostty/cursor_warp.glsl".source = ./cursor_warp.glsl;
    "ghostty/cursor_tail.glsl".source = ./cursor_tail.glsl;
  };
}
