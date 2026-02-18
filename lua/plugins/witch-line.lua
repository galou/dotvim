-- Status line.
-- https://github.com/sontungexpt/witch-line

return {
{
  'sontungexpt/witch-line',
  enabled = false,  -- Didn't manage to configure it properly. Use `nvim-airline` instead.

  opts = {
    --- @type CombinedComponent[]
    abstract = {},

    --- @type CombinedComponent[]
    components = {
      'mode',
      'file.name',
      'file.icon',
      {
        id = 'component_id',               -- Unique identifier
        padding = { left = 1, right = 1 }, -- Padding around the component
        static = { some_key = 'some_value' }, -- Static metadata
        timing = false,                 -- No timing updates
        style = { fg = '#ffffff', bg = '#000000', bold = true }, -- Style override
        min_screen_width = 80,          -- Hide if screen width < 80
        hidden = function()               -- Hide condition
          return vim.bo.buftype == 'nofile'
        end,
        left_style = { fg = '#ff0000' }, -- Left style override
        update = function(self, ctx, static, session_id) -- Main content generator
          return vim.fn.expand('%:t')
        end,
        ref = {                       -- References to other components
          events = { 'file.name' },
          style = 'file.name',
          static = 'file.name',
        },
      },
    },
    disabled = {
      filetypes = { 'help', 'TelescopePrompt' },
      buftypes = { 'nofile', 'terminal' },
    },
  },
}
}
