-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.recipes.cache-colorscheme" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- import/override with your plugins folder
}
