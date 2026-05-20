{ ... }: {
  imports = [
    ./basic.nix   # 各种 opts 放这里（如 number, shiftwidth）
    ./keymap.nix  # 快捷键映射放这里
    ./autocmd.nix # 自动命令放这里
  ];
}