-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到 nvim-tree")
  return
end
require'nvim-tree'.setup {
     -- 完全禁止内置netrw
  disable_netrw = true,
    -- 关闭文件时自动关闭
    auto_close = true,
    -- 不显示 git 状态图标
    git = {
        enable = false
    },
    filters = {
    -- 隐藏 .文件
    dotfiles = true,
    -- 隐藏 node_modules 文件夹
    -- custom = { "node_modules" },
  },
  view = {
      -- 隐藏根目录
    hide_root_folder = true,
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时关闭 tree
      quit_on_open = false,
    },
  },
}