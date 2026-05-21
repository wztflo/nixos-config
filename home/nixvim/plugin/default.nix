{ ... }:
{
  imports = [
    ./ui # 引入 UI 类插件（会自动找 ui/default.nix，内部可再引入 lualine 等）
    ./lsp # 引入 LSP 类插件（会自动找 lsp/default.nix，内部引入 nvim-cmp 等）
    ./editor
  ];
}
