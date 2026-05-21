{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      folding.enable = false;
      nixvimInjections = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
        incremental_selection.enable = true;
      };

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        lua
        python
        rust
        go
        javascript
        typescript
        tsx
        html
        css
        json
        toml
        nix
        markdown
        vim
        vimdoc
        xml
        yaml
        diff
      ];
    };

    treesitter.lazyLoad = {
      enable = true;
      settings = {
        event = [
          "BufReadPost"
          "BufNewFile"
        ];
      };
    };
  };

}
