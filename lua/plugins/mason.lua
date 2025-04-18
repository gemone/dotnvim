-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server", -- for lua
        "vue-language-server", -- for vue
        "gopls", -- for go
        "clangd", -- c/c++
        "rust-analyzer", -- for rust
        "ruff", -- for python

        -- install formatters
        "stylua",
        "prettierd",
        "eslint_d",

        -- install debuggers
        "debugpy",
        "codelldb",
        "delve",
        "vscode-java-decompiler",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
