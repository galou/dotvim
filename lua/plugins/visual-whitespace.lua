-- Reveal whitespace characters in visual mode only.
-- https://github.com/mcauley-penney/visual-whitespace.nvim
return {
{
  'mcauley-penney/visual-whitespace.nvim',
  config = true,
  event = "ModeChanged *:[vV\22]", -- lazy load on entering visual mode
  opts = {
    enabled = true,
    highlight = { link = "Visual" },
    space_char = '·',
    tab_char = '→',
    unix_char = '↲',
    mac_char = '←',
    dos_char = '↙',
    excluded = {
      filetypes = {},
      buftypes = {}
    }
  },
}
}
