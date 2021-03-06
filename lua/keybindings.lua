-- mode
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap
-- quick select all
map('n', '<leader>a', 'ggVG',opt)
map("i", "jj", "<esc>", opt)
-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- 命令行下 ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })
-- save and exit
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<c-u>", "10k", opt)
map("n", "<c-d>", "10j", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 在visual mode 里粘贴不要复制
-- map("v", "p", '"_dp', opt)

-- 退出
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)
------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<cr>", opt)
map("n", "sh", ":sp<cr>", opt)
-- 关闭当前
map("n", "sc", "<c-w>c", opt)
-- 关闭其他
map("n", "so", "<c-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<a-h>", "<c-w>h", opt)
map("n", "<a-j>", "<c-w>j", opt)
map("n", "<a-k>", "<c-w>k", opt)
map("n", "<a-l>", "<c-w>l", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<c-w>h", opt)
map("n", "<leader>j", "<c-w>j", opt)
map("n", "<leader>k", "<c-w>k", opt)
map("n", "<leader>l", "<c-w>l", opt)
-- 左右比例控制
map("n", "<c-left>", ":vertical resize -2<cr>", opt)
map("n", "<c-right>", ":vertical resize +2<cr>", opt)
map("n", "s,", ":vertical resize -10<cr>", opt)
map("n", "s.", ":vertical resize +10<cr>", opt)
-- 上下比例
map("n", "sj", ":resize +10<cr>", opt)
map("n", "sk", ":resize -10<cr>", opt)
map("n", "<c-down>", ":resize +2<cr>", opt)
map("n", "<c-up>", ":resize -2<cr>", opt)
-- 相等比例
map("n", "s=", "<c-w>=", opt)

-- terminal相关
map("n", "st", ":sp | terminal<cr>", opt)
map("n", "stv", ":vsp | terminal<cr>", opt)
-- esc 回 normal 模式
map("t", "<esc>", "<c-\\><c-n>", opt)
map("t", "<a-h>", [[ <c-\><c-n><c-w>h ]], opt)
map("t", "<a-j>", [[ <c-\><c-n><c-w>j ]], opt)
map("t", "<a-k>", [[ <c-\><c-n><c-w>k ]], opt)
map("t", "<a-l>", [[ <c-\><c-n><c-w>l ]], opt)
map("t", "<leader>h", [[ <c-\><c-n><c-w>h ]], opt)
map("t", "<leader>j", [[ <c-\><c-n><c-w>j ]], opt)
map("t", "<leader>k", [[ <c-\><c-n><c-w>k ]], opt)
map("t", "<leader>l", [[ <c-\><c-n><c-w>l ]], opt)

--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- telescope
map( "n","<C-p>","<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", opt)
map("n", "<C-f>", ":Telescope live_grep<cr>", opt)

-- telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- 历史记录
    ["<down>"] = "cycle_history_next",
    ["<up>"] = "cycle_history_prev",
    -- 关闭窗口
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- nvimtree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
  { key = { "o", "<2-leftmouse>" }, action = "edit" },
  { key = { "<tab>" }, action = "preview" },
  { key = "<cr>", action = "edit" },
  -- v分屏打开文件
  { key = "v", action = "vsplit" },
  -- h分屏打开文件
  { key = "h", action = "split" },
  -- ignore (node_modules)
  { key = "i", action = "toggle_ignored" },
  -- hide (dotfiles)
  { key = ".", action = "toggle_dotfiles" },
  { key = "r", action = "refresh" },
  -- 文件操作
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "i", action = "toggle_file_info" },
  { key = "n", action = "tabnew" },
  -- 进入下一级
  { key = { "]" }, action = "cd" },
  -- 进入上一级
  { key = { "[" }, action = "dir_up" },
}

--comment
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  -- normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  },
}
-- ctrl + /
map("n", "<c-_>", "gcc", { noremap = false })
map("v", "<c-_>", "gc", { noremap = false })


-- bufferline
-- 左右tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<C-w>", ":Bdelete!<cr>", opt)
-- 关闭左/右侧标签页
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 关闭选中标签页
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  return {
    -- 上一个
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(),{ "i", "c" }),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- accept currently selected item. if none selected, `select` first item.
    -- set `select` to `false` to only confirm explicitly selected items.
    ["<cr>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.replace,
    }),
    -- ['<c-y>'] = cmp.config.disable, -- specify `cmp.config.disable` if you want to remove the default `<c-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- snippets 跳转
    ["<C-l>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<plug>(vsnip-expand-or-jump)", "")
      end
    end, { "i", "s" }),
    ["<c-h>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    -- super tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- the fallback function sends a already mapped key. in this case, it's probably `<tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super tab
  }
end
return pluginKeys
