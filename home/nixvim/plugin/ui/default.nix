{ ... }:
{
  imports = [
    ./neotree.nix
    ./noice.nix
    ./bufferline.nix
    ./lualine.nix
    ./colorscheme.nix
    ./yazi.nix
  ];

  plugins.mini-icons = {
    enable = true;
    mockDevIcons = true;
  };

}
