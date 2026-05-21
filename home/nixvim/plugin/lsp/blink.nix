{ ... }:
{
  programs.nixvim.plugins = {
    # 🌟 启用 blink-cmp 插件
    blink-cmp = {
      enable = true;
      settings = {
        # 基础按键映射预设：'default' 或 'super-tab'
        # 'super-tab' 完美符合大部分人的习惯（Tab 选择提示/跳代码片段，Enter 确认）
        keymap.preset = "super-tab";

        # 补全源设置（Blink 内置了这些源，开箱即用，无需额外装包）
        sources.default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];

        # 华丽的补全浮窗美化
        completion = {

          # 美化边框（可选 'none', 'single', 'double', 'rounded'）
          menu.border = "rounded";
          documentation.window.border = "rounded";

          # 在提示列表右侧直接显示华丽的 LSP 标签（如 [Function], [Variable]）
          menu.draw.columns = [
            [ "kind_icon" ]
            [
              "label"
              "label_description"
            ]
          ];
        };

        # 签名帮助（当你输入函数括号时，浮窗提示参数类型）
        signature.enabled = true;
      };
    };
  };
}
