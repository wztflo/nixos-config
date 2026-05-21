{ ... }:
{
  plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = false;

      lazyLoad = {
        settings = {
          event = [
            "InsertEnter"
            "CmdlineEnter"
          ];
        };
      };

      settings = {
        keymap.preset = "super-tab";

        sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];

        completion = {
          menu = {
            enabled = true;
            border = "rounded";
          };
          documentation = {
            auto_show = true;
            window = {
              border = "rounded";
            };
          };
        };

        signature = {
          enabled = true;
          window = {
            border = "rounded";
          };
        };
      };
    };
  };
}
