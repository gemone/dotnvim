local which_utils = require "utils"

if not which_utils.which "git" then return {} end

return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      { "AstroNvim/astroui", opts = { icons = { Neogit = "󰰔" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>g"
          maps.n[prefix] = { desc = require("astroui").get_icon("Neogit", 1, true) .. "Neogit" }
          maps.n[prefix .. "g"] = { "<Cmd>Neogit<CR>", desc = "Open Neogit Tab Page" }
          maps.n[prefix .. "c"] = { "<Cmd>Neogit commit<CR>", desc = "Open Neogit Commit Page" }
          maps.n[prefix .. "d"] = { ":Neogit cwd=", desc = "Open Neogit Override CWD" }
          maps.n[prefix .. "k"] = { ":Neogit kind=", desc = "Open Neogit Override Kind" }
          maps.n[prefix .. "f"] = { "<Cmd>Neogit kind=floating<CR>", desc = "Open Neogit Float" }
          maps.n[prefix .. "h"] = { "<Cmd>Neogit kind=split<CR>", desc = "Open Neogit Horizontal Split" }
          maps.n[prefix .. "v"] = { "<Cmd>Neogit kind=vsplit<CR>", desc = "Open Neogit Vertical Split" }
        end,
      },
    },
    specs = {
      {
        "catppuccin",
        optional = true,
        opts = { integrations = { neogit = true } },
      },
    },
    event = "User AstroGitFile",
    opts = function(_, opts)
      local utils = require "astrocore"
      local disable_builtin_notifications = utils.is_available "nvim-notify" or utils.is_available "noice.nvim"
      if utils.is_available "snacks.nvim" then
        local snacks_notifier = utils.plugin_opts("snacks.nvim").notifier
        if snacks_notifier and vim.tbl_get(snacks_notifier, "enabled") ~= false then
          disable_builtin_notifications = true
        end
      end

      return utils.extend_tbl(opts, {
        disable_builtin_notifications = disable_builtin_notifications,
        disable_signs = true,
        telescope_sorter = function()
          if utils.is_available "telescope-fzf-native.nvim" then
            return require("telescope").extensions.fzf.native_fzf_sorter()
          end
        end,
        integrations = {
          telescope = utils.is_available "telescope.nvim",
          diffview = utils.is_available "diffview.nvim",
          fzf_lua = utils.is_available "fzf-lua",
          mini_pick = utils.is_available "mini.pick",
        },
      })
    end,
  },

  {
    "f-person/git-blame.nvim",
    event = "User AstroGitFile",
  },

  {
    "sindrets/diffview.nvim",
    event = "User AstroGitFile",
    cmd = { "DiffviewOpen" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = true },
        file_history = { winbar_info = true },
      },
      hooks = { diff_buf_read = function(bufnr) vim.b[bufnr].view_activated = false end },
    },
    specs = {
      {
        "NeogitOrg/neogit",
        optional = true,
        opts = { integrations = { diffview = true } },
      },
    },
  },
}
