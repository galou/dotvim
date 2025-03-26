-- https://github.com/olimorris/codecompanion.nvim
-- https://codecompanion.olimorris.dev/getting-started.html

return {
  {'olimorris/codecompanion.nvim',
    config = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },

    opts = {
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
      },
      display = {
        action_palette = {
          provider = 'telescope',  -- 'default'|'telescope'|'mini_pick'
        },
        chat = {
          auto_scroll = false,
        },
        diff = {
          enable = false,  -- Seems broken and key bindings to accept doesn't work on my setup, deactivate for now.
          provider = 'mini_diff', -- 'default'|'mini_diff'
        },
      },
    },
  },
}
