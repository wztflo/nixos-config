{ ... }: {
  programs.nixvim.plugins.rainbow-delimiters = {
    enable = true;

    settings = {
    blacklist = [
      "json"
    ];
    highlight = [
      "RainbowDelimiterViolet"
      "RainbowDelimiterBlue"
      "RainbowDelimiterGreen"
    ];
  };
  };

  # plugins.rainbow-delimiters.strategy = {
  #  "" = "global";
  #   html = "local";
  #  };
}