-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.python3_host_prog = vim.fn.expand("~/nvim-python/bin/python3")
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- delay update diagnostics
  update_in_insert = false,
})
-- require("lspconfig").verible.setup({
--   -- cmd = { 'verible-verilog-ls', '--rules_config_search' },
--   cmd = { "verible-verilog-ls" },
--   root_dir = require("lspconfig").util.root_pattern({ ".git", "verilator.f" }),
--   -- capabilities = capabilities,
--   format_on_save = true,
-- })
require("config.lazy")
vim.cmd("runtime! plugin/rplugin.vim")
