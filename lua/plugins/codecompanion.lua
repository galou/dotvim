-- CodeCompanion is a productivity tool which streamlines how you develop with LLMs,
-- in Neovim.
-- https://github.com/olimorris/codecompanion.nvim
-- https://codecompanion.olimorris.dev/getting-started.html

return {
{
  'olimorris/codecompanion.nvim',
  config = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    '"j-hui/fidget.nvim',  -- because of `fidget-spinner` below.
    -- 'echasnovski/mini.nvim',  -- activate if `mini_diff` below.
  },

  opts = {
    strategies = {
      chat = {
        adapter = 'copilot',
        keymaps = {
          completion = {
            modes = {
              i = "<C-->",  -- Normally mapped to "<C-_>" but this is captured by Kitty. Completion opens automatically anyway.
            },
          },
        },
      },
      inline = {
        adapter = 'copilot',
      },
    },
    display = {
      action_palette = {
        provider = 'telescope',  -- 'default'|'telescope'|'mini_pick'|'fzf_lua'|'snacks'. If not specified, the plugin will autodetect installed providers.
      },
      chat = {
        auto_scroll = false,
      },
      diff = {
        enable = true,  -- "ga" to accept, "gr" to refuse
        provider = 'default', -- 'default'|'mini_diff'
        opts = {
          "internal",
          "filler",
          "closeoff",
          "algorithm:patience",
          "followwrap",
          "linematch:120",
        },
      },
    },
  },
  init = function()
    require("plugins.codecompanion.fidget-spinner"):init()
  end,
},
}
