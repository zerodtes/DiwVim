return {
  plugins = {
    {
      "nvimtools/none-ls.nvim",
      opts = function(_, opts)
        local null_ls = require "null-ls"

        opts.sources = vim.list_extend(opts.sources or {}, {
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.diagnostics.flake8,

          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.diagnostics.clang_check, -- or clang_tidy

          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.diagnostics.golangci_lint,

          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint_d,

          null_ls.builtins.formatting.biome, -- added by me
          null_ls.builtins.formatting.gomodifytags, -- added by me
        })
      end,
    },
    {
      "dmmulroy/ts-error-translator.nvim",
      ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      opts = {},
    },
  },

  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = { "*" },
        ignore_filetypes = {},
      },
    },
  },
}
