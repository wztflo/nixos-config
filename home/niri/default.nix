{ ... }:

{
  xdg.configFile = {
    "niri/config.kdl".source = ./configs/config.kdl;
    "niri/input.kdl".source = ./configs/input.kdl;
    "niri/output.kdl".source = ./configs/output.kdl;
    "niri/layout.kdl".source = ./configs/layout.kdl;
    "niri/misc.kdl".source = ./configs/misc.kdl;
    "niri/animations.kdl".source = ./configs/animations.kdl;
    "niri/window-rules.kdl".source = ./configs/window-rules.kdl;
    "niri/noctalia.kdl".source = ./configs/noctalia.kdl;
    "niri/binds.kdl".source = ./configs/binds.kdl;
  };
}
