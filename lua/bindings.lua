local opts = {noremap = true, silent = true}

-- LuaSnip
-- -------

-- <C-e> is the expansion key.
-- This will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<C-e>", function()
  local ls = require('luasnip')
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, opts)

-- <C-S-e> requires special support from the terminal emulator.
-- Cf. https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/.
vim.keymap.set({ "i", "s" }, "<C-S-e>", function()
  local ls = require('luasnip')
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, opts)

-- nvim-scissors.
-- --------------
vim.keymap.set("n", "<localleader>se", function() require("scissors").editSnippet() end)
-- When used in visual mode prefills the selection as body.
vim.keymap.set({ "n", "x" }, "<localleader>sa", function() require("scissors").addNewSnippet() end)

-- Syntax Tree Surfer
-- ------------------
-- Cf. https://github.com/ziontee113/syntax-tree-surfer

-- Normal Mode Swapping:
-- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vU", function()
	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vD", function()
	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

-- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vd", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vu", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

--> If the mappings above don't work, use these instead (no dot repeatable)
-- vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
-- vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
-- vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
-- vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)

-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)

-- Select Nodes in Visual Mode
vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', opts)
vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', opts)
vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', opts)
vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', opts)

-- Swapping Nodes in Visual Mode
vim.keymap.set("x", "<A-j>", '<cmd>STSSwapNextVisual<cr>', opts)
vim.keymap.set("x", "<A-k>", '<cmd>STSSwapPrevVisual<cr>', opts)

-- Jump to functions
-- The Lua language schema uses "function", Python uses "function_definition".
-- We include both, so this keymap will work on both languages.
vim.keymap.set("n", "gfu", function()
    require('syntax-tree-surfer').targeted_jump({ "function", "arrrow_function", "function_definition" })
  end, opts)

-- Repeat the last jump.
-- "default" means that you jump to the default_desired_types or your lastest jump types
vim.keymap.set("n", "<A-n>", function()
      require('syntax-tree-surfer').filtered_jump("default", true) --> true means jump forward
  end, opts)
vim.keymap.set("n", "<A-p>", function()
      require('syntax-tree-surfer').filtered_jump("default", false) --> false means jump backwards
  end, opts)

-- dial (improved increment)
-- -------------------------
-- Use [count]g<C-a> in line-wise or block-wise visual mode to
-- increment by [count] at each line relative to its predecessor.
vim.keymap.set("n", "<C-a>", require('dial.map').inc_normal(), opts)
vim.keymap.set("n", "<C-x>", require('dial.map').dec_normal(), opts)
vim.keymap.set("v", "<C-a>", require('dial.map').inc_visual(), opts)
vim.keymap.set("v", "<C-x>", require('dial.map').dec_visual(), opts)
vim.keymap.set("v", "g<C-a>", require('dial.map').inc_gvisual(), opts)
vim.keymap.set("v", "g<C-x>", require('dial.map').dec_gvisual(), opts)

-- Aerial
-- ------
vim.keymap.set('n', '<localleader>a', '<cmd>AerialToggle!<CR>', opts)

-- query-secretary
-- ---------------
-- Defined in lazy.lua for lazy loading.

-- Oatmeal
-- -------
vim.keymap.set('n', '<localleader>om', '<cmd>Oatmeal<CR>', opts)

-- <C-*> for * with telescope-live-grep-args.
-- vim.keymap.set('n', '<C-*>', require('telescope-live-grep-args.shortcuts').live_grep_args_shortcuts.grep_word_under_cursor, opts)

-- BufferChad
-- ----------
-- In normal mode
-- <localleader>fb: opens the bufferchad window.
-- <localleader>f': opens the bufferchad window with only the marked buffers.
-- mset: mark buffer
-- 1set, 2set, ...: mark buffer 1, 2, ...
-- 1nav, 2nav, ...: jump to buffer 1, 2, ...
-- mdel: delete mark

-- ros-nvim
-- --------
-- <localleader>fr: Telescope ros ros
-- follow links in launch files
vim.keymap.set('n', '<localleader>rol', function() require('ros-nvim.ros').open_launch_include() end, opts)
-- show definition for interfaces (messages/services) in floating window
vim.keymap.set('n', '<localleader>rdi', function() require('ros-nvim.ros').show_interface_definition() end, opts)

-- delimited.nvim
-- --------------
vim.keymap.set('n', '[d', require('delimited').goto_prev, opts)
vim.keymap.set('n', ']d', require('delimited').goto_next, opts)
vim.keymap.set('n', '[D', function() require('delimited').goto_prev({severity = vim.diagnostic.severity.ERROR}) end, opts)
vim.keymap.set('n', ']D', function() require('delimited').goto_next({severity = vim.diagnostic.severity.ERROR}) end, opts)

-- copilot.lua
-- -----------
-- Workaround suggestion/accept (<M-l>) not working.
vim.keymap.set('i', '<M-l>', function()
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.name == "copilot" then
      require('copilot.suggestion').accept()
      return
    end
  end
  return "<M-l>"
end,
{
    desc = '[copilot] accept suggestion',
    expr = true,
    noremap = true,
})

-- before.nvim
-- -----------
-- Jump to previous entry in the edit history
vim.keymap.set('n', '<C-k>', require('before').jump_to_last_edit, opts)

-- Jump to next entry in the edit history
vim.keymap.set('n', '<C-j>', require('before').jump_to_next_edit, opts)

-- Look for previous edits in quickfix list
vim.keymap.set('n', '<localleader>oq', require('before').show_edits_in_quickfix, opts)

-- Look for previous edits in telescope (needs telescope, obviously)
vim.keymap.set('n', '<localleader>oe', require('before').show_edits_in_telescope, opts)

-- multicursor.nvim
-- ----------------

vim.keymap.set("n", "<esc>", function()
  local mc = require("multicursor-nvim")
  if mc.hasCursors() then
    mc.clearCursors()
  else
    -- default <esc> handler
  end
end)

-- add cursors above/below the main cursor
-- vim.keymap.set("n", "<up>", function() mc.addCursor("k") end)
-- vim.keymap.set("n", "<down>", function() mc.addCursor("j") end)

-- add a cursor and jump to the next word under cursor
-- vim.keymap.set("n", "<c-n>", function() mc.addCursor("*") end)

-- jump to the next word under cursor but do not add a cursor
-- vim.keymap.set("n", "<c-s>", function() mc.skipCursor("*") end)

-- add and remove cursors with control + left click
vim.keymap.set("n", "<c-leftmouse>", require("multicursor-nvim").handleMouse)

-- hop.nvim
-- --------
vim.keymap.set('n', '|', require('hop').hint_anywhere)

-- fastaction.nvim
-- ---------------
vim.keymap.set('n', '<localleader>fa', require('fastaction').code_action, opts)

-- molten.nvim
-- -----------
-- https:://github.com/tjdevries/molten.nvim
vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>",
    { noremap = true, silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>",
    { noremap = true, silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<C-CR>", ":MoltenEvaluateLine<CR>",
    { noremap = true, silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>",
    { noremap = true, silent = true, desc = "re-evaluate cell" })
vim.keymap.set("v", "<C-CR>", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { noremap = true, silent = true, desc = "evaluate visual selection" })
vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>",
    { noremap = true, silent = true, desc = "molten delete cell" })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>",
    { noremap = true, silent = true, desc = "hide output" })
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>",
    { noremap = true, silent = true, desc = "show/enter output" })
