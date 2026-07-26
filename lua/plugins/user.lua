-- User plugins and overrides for DiwVim

---@type LazySpec
return {

  -- == Colorscheme ==

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup {
        style = "night", -- options: night, storm, moon, day
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      }
      vim.cmd [[colorscheme tokyonight]]
    end,
  },

  -- == Dashboard ==

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "██████  ██ ██     ██ ██    ██ ██ ███    ███",
            "██   ██ ██ ██     ██ ██    ██ ██ ████  ████",
            "██   ██ ██ ██  █  ██ ██    ██ ██ ██ ████ ██",
            "██   ██ ██ ██ ███ ██  ██  ██  ██ ██  ██  ██",
            "██████  ██  ███ ███    ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- == Language extras ==

  -- translate cryptic TypeScript errors into plain English
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {},
  },

  -- == Claude Code integration ==

  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {},
    keys = {
      { "<Leader>a", nil, desc = "AI/Claude Code" },
      { "<Leader>ac", "<cmd>ClaudeCode<CR>", desc = "Toggle Claude" },
      { "<Leader>af", "<cmd>ClaudeCodeFocus<CR>", desc = "Focus Claude" },
      { "<Leader>ar", "<cmd>ClaudeCode --resume<CR>", desc = "Resume Claude" },
      { "<Leader>aC", "<cmd>ClaudeCode --continue<CR>", desc = "Continue Claude" },
      { "<Leader>ab", "<cmd>ClaudeCodeAdd %<CR>", desc = "Add current buffer" },
      { "<Leader>as", "<cmd>ClaudeCodeSend<CR>", mode = "v", desc = "Send selection to Claude" },
      {
        "<Leader>as",
        "<cmd>ClaudeCodeTreeAdd<CR>",
        desc = "Add file from tree",
        ft = { "neo-tree", "oil" },
      },
      { "<Leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>", desc = "Accept diff" },
      { "<Leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>", desc = "Deny diff" },
    },
  },

  -- == Plugin overrides ==

  -- disable rolling j/k escape mapping
  { "max397574/better-escape.nvim", enabled = false },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
}
