-- Other bindings
-- --------------
-- lua/plugins/kulala.lua

-- No recursive mapping and silent.
local opts = { noremap = true, silent = true }

-- Function to update and return the table
local function desc(description)
    local opts_with_desc = {}
    for k, v in pairs(opts) do
      opts_with_desc[k] = v
    end
    opts_with_desc.desc = description
    return opts_with_desc
end

-- LSP (native)
-- ------------
vim.keymap.set('n', '<localleader>gh', vim.lsp.buf.hover, desc('Hover'))
vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, desc('Code Action'))
vim.keymap.set('n', '<localleader>e', vim.diagnostic.open_float, desc('Open diagnostics float'))
vim.keymap.set('n', '<localleader>ff', vim.lsp.buf.format, desc('Format document'))
vim.keymap.set('n', '<localleader>gD', vim.lsp.buf.declaration, desc('Go to declaration'))
vim.keymap.set('n', '<localleader>gd', vim.lsp.buf.definition, desc('Go to definition'))
vim.keymap.set('n', '<localleader>gi', vim.lsp.buf.implementation, desc('Go to implementation'))
vim.keymap.set('n', '<localleader>go', vim.lsp.buf.signature_help, desc('Signature help'))
vim.keymap.set('n', '<localleader>gr', vim.lsp.buf.references, desc('Go to references'))
vim.keymap.set('n', '<localleader>gt', vim.lsp.buf.type_definition, desc('Go to type definition'))
vim.keymap.set('n', '<localleader>q', vim.diagnostic.setloclist, desc('Open diagnostics in loclist'))
vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, desc('Rename symbol'))
vim.keymap.set('n', '<localleader>wa', vim.lsp.buf.add_workspace_folder, desc('Add workspace folder'))
vim.keymap.set('n', '<localleader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc('List workspace folders'))
vim.keymap.set('n', '<localleader>wr', vim.lsp.buf.remove_workspace_folder, desc('Remove workspace folder'))
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count=-1}) end, desc('Previous diagnostic'))
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count=1}) end, desc('Next diagnostic'))

-- LuaSnip
-- -------

-- <C-e> is the expansion key.
-- This will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<C-e>", function()
	local ls = require('luasnip')
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, desc('Expand or jump in snippet'))

-- <C-S-e> requires special support from the terminal emulator.
-- Cf. https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/.
vim.keymap.set({ "i", "s" }, "<C-S-e>", function()
	local ls = require('luasnip')
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, desc('Jump to previous snippet item'))

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
-- vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', desc('Swap current node next'))
-- vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', desc('Swap current node previous'))
-- vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', desc('Swap down'))
-- vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', desc('Swap up'))

-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', desc('Select master node'))
vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', desc('Select current node'))

-- Select Nodes in Visual Mode
vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', desc('Select next sibling node'))
vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', desc('Select previous sibling node'))
vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', desc('Select parent node'))
vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', desc('Select child node'))

-- Swapping Nodes in Visual Mode
vim.keymap.set("x", "<A-j>", '<cmd>STSSwapNextVisual<cr>', desc('Swap next visual'))
vim.keymap.set("x", "<A-k>", '<cmd>STSSwapPrevVisual<cr>', desc('Swap previous visual'))

-- Jump to functions
-- The Lua language schema uses "function", Python uses "function_definition".
-- We include both, so this keymap will work on both languages.
vim.keymap.set("n", "gfu", function()
	require('syntax-tree-surfer').targeted_jump({ "function", "arrrow_function", "function_definition" })
end, desc('Jump to function'))

-- Repeat the last jump.
-- "default" means that you jump to the default_desired_types or your lastest jump types
vim.keymap.set("n", "<A-n>", function()
	require('syntax-tree-surfer').filtered_jump("default", true)     --> true means jump forward
end, desc('Repeat last jump forward'))
vim.keymap.set("n", "<A-p>", function()
	require('syntax-tree-surfer').filtered_jump("default", false)     --> false means jump backwards
end, desc('Repeat last jump backward'))

-- dial (improved increment)
-- -------------------------
-- Use [count]g<C-a> in line-wise or block-wise visual mode to
-- increment by [count] at each line relative to its predecessor.
vim.keymap.set("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal") end)
vim.keymap.set("n", "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end)
vim.keymap.set("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end)
vim.keymap.set("n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end)
vim.keymap.set("v", "<C-a>", function() require("dial.map").manipulate("increment", "visual") end)
vim.keymap.set("v", "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end)
vim.keymap.set("v", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end)
vim.keymap.set("v", "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end)

-- Aerial
-- ------
vim.keymap.set('n', '<localleader>a', '<cmd>AerialToggle!<CR>', desc('Toggle Aerial'))

-- query-secretary
-- ---------------
-- Defined in lazy.lua for lazy loading.

-- Oatmeal
-- -------
vim.keymap.set('n', '<localleader>om', '<cmd>Oatmeal<CR>', desc('Toggle Oatmeal'))

-- <C-*> for * with telescope-live-grep-args.
-- vim.keymap.set('n', '<C-*>', require('telescope-live-grep-args.shortcuts').live_grep_args_shortcuts.grep_word_under_cursor, desc('Grep word under cursor'))

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
vim.keymap.set('n', '<localleader>rol', function() require('ros-nvim.ros').open_launch_include() end, desc('Open ROS launch include'))
-- show definition for interfaces (messages/services) in floating window
vim.keymap.set('n', '<localleader>rdi', function() require('ros-nvim.ros').show_interface_definition() end, desc('Show ROS interface definition'))

-- delimited.nvim
-- --------------
vim.keymap.set('n', '[d', function() require('delimited').goto_prev({}) end, desc('Go to previous delimited item'))
vim.keymap.set('n', ']d', function() require('delimited').goto_next({}) end, desc('Go to next delimited item'))
vim.keymap.set('n', '[D', function() require('delimited').goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
	desc('Go to previous error'))
vim.keymap.set('n', ']D', function() require('delimited').goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
	desc('Go to next error'))

-- copilot.lua
-- -----------
-- Workaround suggestion/accept (<M-l>) not working.
vim.keymap.set('i', '<M-l>', function()
		local clients = vim.lsp.get_clients()
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
vim.keymap.set('n', '<C-k>', require('before').jump_to_last_edit, desc('Jump to last edit'))

-- Jump to next entry in the edit history
vim.keymap.set('n', '<C-j>', require('before').jump_to_next_edit, desc('Jump to next edit'))

-- Look for previous edits in quickfix list
vim.keymap.set('n', '<localleader>oq', require('before').show_edits_in_quickfix, desc('Show edits in quickfix'))

-- Look for previous edits in telescope (needs telescope, obviously)
vim.keymap.set('n', '<localleader>oe', require('before').show_edits_in_telescope, desc('Show edits in Telescope'))

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
vim.keymap.set("n", "<c-leftmouse>", function() require("multicursor-nvim").handleMouse() end, desc('Add/remove cursor with mouse'))

-- hop.nvim
-- --------
vim.keymap.set('n', '|', require('hop').hint_anywhere)

-- fastaction.nvim
-- ---------------
vim.keymap.set('n', '<localleader>fa', require('fastaction').code_action, desc('Code action'))

-- molten.nvim
-- -----------
-- https:://github.com/tjdevries/molten.nvim
vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", desc("Initialize the plugin"))
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", desc("run operator selection"))
vim.keymap.set("n", "<C-CR>", ":MoltenEvaluateLine<CR>", desc("evaluate line"))
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", desc("re-evaluate cell"))
vim.keymap.set("v", "<C-CR>", ":<C-u>MoltenEvaluateVisual<CR>gv", desc("evaluate visual selection"))
vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", desc("molten delete cell"))
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", desc("hide output"))
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", desc("show/enter output"))
