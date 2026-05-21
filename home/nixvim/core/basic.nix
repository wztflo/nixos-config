{ ... }:
{
  opts = {
    # ---- 行号设置 ----
    number = true; # 显示绝对行号
    relativenumber = true; # 显示相对行号（极度方便跳转）

    # ---- 缩进与空格 ----
    shiftwidth = 2; # 自动缩进时使用的空格数
    tabstop = 2; # Tab 键占用的空格数
    expandtab = true; # 将 Tab 键自动转换为空格
    smartindent = true; # 开启智能缩进

    # ---- 搜索设置 ----
    ignorecase = true; # 搜索时忽略大小写
    smartcase = true; # 如果搜索词包含大写字母，则不忽略大小写
    hlsearch = true; # 高亮显示搜索结果
    incsearch = true; # 搜索输入时实时预览匹配结果

    # ---- 界面与体验 ----
    termguicolors = true; # 开启真彩色支持（现代主题必需）
    cursorline = true; # 高亮当前行
    signcolumn = "yes"; # 总是显示左侧符号列（防止 LSP/Git 符号弹出时画面抖动）
    wrap = false; # 禁止文本折行
    scrolloff = 8; # 光标移动到屏幕边缘时，保持上下各有 8 行的缓冲区
    sidescrolloff = 8; # 左右滚动时的缓冲区

    # ---- 系统与文件 ----
    clipboard = "unnamedplus"; # 共享系统剪贴板（可以直接 y/p 复制粘贴系统文本）
    undofile = true; # 开启持久化撤销（关闭文件重新打开后仍能 undo）
    swapfile = false; # 禁用 swap 缓存文件
    backup = false; # 禁用备份文件
    updatetime = 300; # 响应时间从 4000ms 降低到 3000ms/300ms（加快 LSP 提示和闪烁速度）
    timeoutlen = 500; # 快捷键序列等待超时时间（毫秒）

    # ---- 拆分窗口方向 ----
    splitright = true; # 水平拆分窗口时，新窗口在右侧
    splitbelow = true; # 垂直拆分窗口时，新窗口在下方
  };
}
