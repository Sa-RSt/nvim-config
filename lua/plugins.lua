return {
  {
    "GCBallesteros/NotebookNavigator.nvim",
    keys = {
      { "<leader>rr", "<cmd>lua require('notebook-navigator').run_cell()<cr>", desc = "Run cell" },
      { "<leader>rR", "<cmd>lua require('notebook-navigator').run_and_move()<cr>", desc = "Run cell and move to next" },
      { "<leader>r[", "<cmd>lua require('notebook-navigator').swap_cell('u')<cr>", desc = "Swap with cell above" },
      { "<leader>r]", "<cmd>lua require('notebook-navigator').swap_cell('d')<cr>", desc = "Swap with cell below" },
      { "<leader>ra", "<cmd>lua require('notebook-navigator').comment_cell()<cr>", desc = "Comment current cell" },
      { "<leader>rj", "<cmd>lua require('notebook-navigator').move_cell('d')<cr>", desc = "Move down" },
      { "<leader>rk", "<cmd>lua require('notebook-navigator').move_cell('u')<cr>", desc = "Move up" },
      { "<leader>rm", "<cmd>lua require('notebook-navigator').merge_cell('d')<cr>", desc = "Merge down" },
      { "<leader>rM", "<cmd>lua require('notebook-navigator').merge_cell('u')<cr>", desc = "Merge up" },
      { "<leader>rf", "<cmd>lua require('notebook-navigator').run_all_cells()<cr>", desc = "Run all cells" },
      { "<leader>r=", "<cmd>lua require('notebook-navigator').add_cell_below()<cr>", desc = "Add below" },
      { "<leader>r+", "<cmd>lua require('notebook-navigator').add_cell_above()<cr>", desc = "Add above" },
      { "<leader>rv", "<cmd>lua require('notebook-navigator').run_cells_below()<cr>", desc = "Run below" },
      { "<leader>re", ":MoltenEvaluateOperator<cr>", desc = "Eval operator" },
      { "<leader>rd", ":MoltenDelete<cr>", desc = "Delete cell" },
      { "<leader>ro", ":noautocmd MoltenEnterOutput<cr>", desc = "Enter cell output" },
    },
    dependencies = {
      "echasnovski/mini.comment",
      -- "hkupty/iron.nvim", -- repl provider
      -- "akinsho/toggleterm.nvim", -- alternative repl provider
      "benlubas/molten-nvim", -- alternative repl provider
      -- "anuvyklack/hydra.nvim",
    },
    event = "VeryLazy",
    config = function()
      local nn = require("notebook-navigator")
      nn.setup({})
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require("notebook-navigator")

      local opts = { highlighters = { cells = nn.minihipatterns_spec } }
      return opts
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require("notebook-navigator")

      local opts = { custom_textobjects = { h = nn.miniai_spec } }
      return opts
    end,
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      max_width = math.huge,
      max_height = math.huge,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy = false,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      --"nvim-telescope/telescope.nvim", -- optional
      --"ibhagwan/fzf-lua",              -- optional
      --"echasnovski/mini.pick",         -- optional
      "folke/snacks.nvim", -- optional
    },
    keys = {
      { "<leader>gn", ":Neogit<cr>", desc = "ℕeogit" },
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {},
      picker = {
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
          explorer = { hidden = true },
        },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "echasnovski/mini.surround",
    version = false,
    opts = {
      -- Add custom surroundings to be used on top of builtin ones. For more
      -- information with examples, see `:h MiniSurround.config`.
      custom_surroundings = nil,

      -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
      highlight_duration = 500,

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = "\\a", -- Add surrounding in Normal and Visual modes
        delete = "\\d", -- Delete surrounding
        find = "\\f", -- Find surrounding (to the right)
        find_left = "\\F", -- Find surrounding (to the left)
        highlight = "\\h", -- Highlight surrounding
        replace = "\\r", -- Replace surrounding
        update_n_lines = "\\n", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },

      -- Number of lines within which surrounding is searched
      n_lines = 20,

      -- Whether to respect selection type:
      -- - Place surroundings on separate lines in linewise mode.
      -- - Place surroundings on each line in blockwise mode.
      respect_selection_type = false,

      -- How to search for surrounding (first inside current line, then inside
      -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
      -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
      -- see `:h MiniSurround.config`.
      search_method = "cover",

      -- Whether to disable showing non-error feedback
      -- This also affects (purely informational) helper messages shown after
      -- idle time if user input is required.
      silent = false,
    },
  },
}
