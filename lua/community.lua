-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

local utils = require "utils"

local config = {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- for language
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },

  -- https://github.com/chrisbra/csv.vim
  { import = "astrocommunity.programming-language-support.csv-vim" },

  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
}

-- for curl
if utils.which "curl" then
  -- https://github.com/rest-nvim/rest.nvim
  table.insert(config, { import = "astrocommunity.programming-language-support.rest-nvim" })
end

-- for git
if utils.which "git" then
  table.insert(config, { import = "astrocommunity.git.neogit" })
  table.insert(config, { import = "astrocommunity.git.git-blame-nvim" })
end

-- for web
if utils.which "node" then
  table.insert(config, { import = "astrocommunity.pack.angular" })
  table.insert(config, { import = "astrocommunity.pack.typescript" })
  table.insert(config, { import = "astrocommunity.pack.vue" })
end

-- for powershell
if utils.which "pwsh" then table.insert(config, { import = "astrocommunity.pack.ps1" }) end

-- for language
if utils.which "rustc" then table.insert(config, { import = "astrocommunity.pack.rust" }) end
if utils.which "clangd" then table.insert(config, { import = "astrocommunity.pack.cpp" }) end
if utils.which "dotnet" then table.insert(config, { import = "astrocommunity.pack.cs-omnisharp" }) end
if utils.which "javac" then
  table.insert(config, { import = "astrocommunity.pack.java" })
  table.insert(config, { import = "astrocommunity.lsp.nvim-java" })
end
if utils.which "go" then
  table.insert(config, { import = "astrocommunity.pack.go" })
  table.insert(config, { import = "astrocommunity.pack.sql" })
end
if utils.which "zig" then table.insert(config, { import = "astrocommunity.pack.zig" }) end

-- import/override with your plugins folder

return config
