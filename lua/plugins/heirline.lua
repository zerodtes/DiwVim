-- Custom statusline for DiwVim: rounded separators plus extra components,
-- appended to AstroNvim's default heirline statusline

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      status = {
        separators = {
          -- rounded caps: U+E0B6 (left half circle) and U+E0B4 (right half circle),
          -- written as byte escapes because these Private Use Area glyphs are easily
          -- mangled by editors/tools that strip non-standard characters
          left = { "\238\130\182", "\238\130\180" },
          right = { "\238\130\182", "\238\130\180" },
        },
        colors = function(colors)
          -- the default components reference these surround colors but AstroNvim never
          -- defines them; harmless while separators were blank spaces, but visible glyphs
          -- would render with a fallback foreground. Pin them to the statusline background
          -- so mid-bar caps stay invisible and only the colored mode blocks show caps.
          for _, name in ipairs {
            "file_info_bg",
            "nav_bg",
            "cmd_info_bg",
            "git_branch_bg",
            "git_diff_bg",
            "diagnostics_bg",
            "treesitter_bg",
            "lsp_bg",
            "virtual_env_bg",
          } do
            colors[name] = colors.section_bg
          end
          return colors
        end,
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      if type(opts.statusline) ~= "table" then return end
      local status = require "astroui.status"

      -- word count for prose filetypes; shows selected/total while in visual modes
      local prose_filetypes = { markdown = true, text = true, tex = true, plaintex = true, typst = true }
      local word_count = status.component.builder {
        {
          provider = function()
            local wc = vim.fn.wordcount()
            if wc.visual_words then return ("%d/%d words"):format(wc.visual_words, wc.words) end
            return ("%d %s"):format(wc.words, wc.words == 1 and "word" or "words")
          end,
        },
        condition = function() return prose_filetypes[vim.bo.filetype] == true end,
        surround = { separator = "left", color = "section_bg" },
      }

      -- lights up while a Claude Code client is attached to claudecode.nvim's WebSocket server;
      -- claudecode.nvim is lazy-loaded on its keymaps, so this must only look at package.loaded
      -- (never require) and must never error mid-redraw, hence the pcall
      local claude_indicator = status.component.builder {
        { provider = "✳ Claude", hl = { fg = "#D97757", bold = true } },
        condition = function()
          local claudecode = package.loaded["claudecode"]
          if not claudecode or type(claudecode.is_claude_connected) ~= "function" then return false end
          local ok, connected = pcall(claudecode.is_claude_connected)
          return ok and connected == true
        end,
        surround = { separator = "right", color = "section_bg" },
      }

      -- default statusline layout: 1 mode, 2 git_branch, 3 file_info, 4 git_diff, 5 diagnostics,
      -- 6 fill, 7 cmd_info, 8 fill, 9 lsp, 10 virtual_env, 11 treesitter, 12 nav, 13 mode
      table.insert(opts.statusline, 9, claude_indicator) -- right cluster, before lsp
      table.insert(opts.statusline, 6, word_count) -- left cluster, after diagnostics
    end,
  },
}
