return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
  },
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = false,
      keymap = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    nes = {
      enabled = false,
      keymap = {
        accept_and_goto = "<leader>p",
        accept = false,
        dismiss = "<Esc>",
      },
    },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
  keys = {
    { "<leader>cx", ":Copilot panel<cr>", desc = "Copilot Panel" },
  },
}
