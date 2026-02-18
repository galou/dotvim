-- LSP file operations in the file explorer (neo-tree).
-- https://github.com/antosha417/nvim-lsp-file-operations
-- There's no key bindings since this plugin subscribes to events from the file explorer.
return {
{
  "antosha417/nvim-lsp-file-operations",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Uncomment whichever supported plugin(s) you use
    -- "nvim-tree/nvim-tree.lua",
    -- "nvim-neo-tree/neo-tree.nvim",
    -- "simonmclean/triptych.nvim"
  },
  config = function()
    require("lsp-file-operations").setup()
  end,
},
}
