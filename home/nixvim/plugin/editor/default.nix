{ ... }: {
  imports = [
    ./treesitter.nix
    ./autopairs.nix
    ./indent-blankline.nix
    ./mini-indentscope.nix
    ./rainbow-delimiters.nix
    ./ufo.nix
  ];
}