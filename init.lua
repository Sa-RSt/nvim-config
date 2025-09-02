-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
require("config.lazy")
vim.cmd("runtime! plugin/rplugin.vim")
