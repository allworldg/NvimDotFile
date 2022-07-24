local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
  vim.notify("lsp_signature not found")
end


lsp_signature.setup({
  bind = true,
  doc_lines = 1,
  toggle_key = "<C-k>",
  floating_window = true,
  floating_window_above_cur_line = true,
  hint_enable = true,
  fix_pos = false,
  -- floating_window_above_first = true,
  log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
  -- hi_parameter = "Search",
  zindex = 1002,
  timer_interval = 100,
  extra_trigger_chars = {},
  handler_opts = {
    border = "rounded", -- "shadow", --{"╭", "─" ,"╮", "│", "╯", "─", "╰", "│" },
  },
  max_height = 4,
})
