{ ... }: {
  programs.nixvim = {
    # 🌟 将全局 Leader 键（前缀键）设为空格
    globals.mapleader = " ";

    keymaps = [
      # ---- 基础控制 ----
      {
        mode = "n";
        key = "<leader>nh";
        action = ":nohlsearch<CR>";
        options.desc = "取消搜索高亮";
      }
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
        options.desc = "保存文件";
      }

      # ---- 窗口管理 (Window Management) ----
      {
        mode = "n";
        key = "<leader>sv";
        action = "<C-w>v";
        options.desc = "垂直拆分窗口";
      }
      {
        mode = "n";
        key = "<leader>sh";
        action = "<C-w>s";
        options.desc = "水平拆分窗口";
      }
      {
        mode = "n";
        key = "<leader>sx";
        action = ":close<CR>";
        options.desc = "关闭当前窗口";
      }

      # ---- 窗口间快速跳转 ----
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "跳转到左侧窗口";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "跳转到下侧窗口";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "跳转到上侧窗口";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "跳转到右侧窗口";
      }

      # ---- 视觉模式下的流氓操作 ----
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options.desc = "整行代码向下移动";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options.desc = "整行代码向上移动";
      }
    ];
  };
}