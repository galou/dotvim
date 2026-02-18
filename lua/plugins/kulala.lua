-- A fully-featured REST Client Interface.
-- https://github.com/mistweaverco/kulala.nvim
--
-- You can also install the Kulala LSP server with `npm install -g @mistweaverco/kulala-ls` (cf. config in `lsp.lua`)

return {
{
  'mistweaverco/kulala.nvim',
  ft = {'http', 'rest'},

  keys = {
    { '<leader>Rs', desc = 'Send request' },
    { '<leader>Ra', desc = 'Send all requests' },
    { '<leader>Rb', desc = 'Open scratchpad' },
  },
  opts = {
    global_keymaps = false,
    global_keymaps_prefix = '<leader>R',
    kulala_keymaps_prefix = "",
  },
}
}
