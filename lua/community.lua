-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- language packs: LSP, treesitter parsers, formatters, linters, and debuggers per language
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },

  -- git: side-by-side diffs and merge conflict resolution
  { import = "astrocommunity.git.diffview-nvim" },

  -- project-wide search and replace with live preview
  { import = "astrocommunity.search.grug-far-nvim" },

  -- list view for diagnostics, references, and quickfix
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- jump anywhere on screen in a few keystrokes
  { import = "astrocommunity.motion.flash-nvim" },

  -- Discord rich presence (maintained replacement for presence.nvim)
  { import = "astrocommunity.media.cord-nvim" },

  -- import/override with your plugins folder
}
