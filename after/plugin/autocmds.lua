local api = vim.api

-- Close some windows with "q".
local close_with_q = api.nvim_create_augroup('close_with_q', { clear = true })
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'help', 'startuptime', 'qf', 'fugitive', 'fugitiveblame'},
    command = [[nnoremap <buffer><silent> q :close<CR>]],
    group = close_with_q,
  }
)
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = 'man',
    command = [[nnoremap <buffer><silent> q :quit<CR>]],
    group = close_with_q,
  }
)

-- Activate Copilot suggestion.
local copilot_suggestion = api.nvim_create_augroup('copilot_suggestion', {clear = true})
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'cpp', 'gitcommit', 'lua', 'python', 'rust'},
    command = 'Copilot suggestion',
    group = copilot_suggestion,
  }
)

-- No line number and other "disturbances" in the special buffers.
local special_buffer_config = api.nvim_create_augroup('special_buffer_config', {clear = true})
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'fugitive', '[CodeCompanion]'},
    group = special_buffer_config,
    callback = function()
      vim.wo.number = false
      vim.wo.relativenumber = false
      vim.wo.signcolumn = 'no'
      vim.wo.foldcolumn = '0'
      vim.wo.colorcolumn = ''
      vim.wo.cursorline = true
      vim.wo.cursorcolumn = false
      vim.wo.list = false
      vim.wo.spell = false
      vim.wo.wrap = false
      vim.wo.linebreak = false
      vim.wo.breakindent = false
    end,
  }
)

local no_mini_cursorword = api.nvim_create_augroup('no_mini_cursorword', {clear = true})
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'markdown', 'rst', 'txt'},
    group = no_mini_cursorword,
    callback = function()
      vim.b.minicursorword_disable = true
    end,
  }
)

-- Debugging with Vimspector.
--
-- Key        | Mapping                                     | Function
-- F3         | <Plug>VimspectorStop                        | Stop debugging.
-- F4         | <Plug>VimspectorRestart                     | Restart debugging with the same configuration.
-- F5         | <Plug>VimspectorContinue                    | When debugging, continue. Otherwise start debugging.
-- F6         | <Plug>VimspectorPause                       | Pause debuggee.
-- F8         | <Plug>VimspectorAddFunctionBreakpoint       | Add a function breakpoint for the expression under cursor
-- <leader>F8 | <Plug>VimspectorRunToCursor                 | Run to Cursor
-- F9         | <Plug>VimspectorToggleBreakpoint            | Toggle line breakpoint on the current line.
-- <leader>F9 | <Plug>VimspectorToggleConditionalBreakpoint | Toggle conditional line breakpoint or logpoint on the current line.
-- F10        | <Plug>VimspectorStepOver                    | Step Over
-- F11        | <Plug>VimspectorStepInto                    | Step Into
-- F12        | <Plug>VimspectorStepOut                     | Step out of current function scope
-- local vimspector_keymap = api.nvim_create_augroup('vimspector_keymap', {clear = true})
-- vim.api.nvim_create_autocmd(
--   'FileType',
--   {
--     pattern = {'c', 'cpp', 'python', 'rust'},
--     group = vimspector_keymap,
--     callback = function()
--       vim.keymap.set('n', '<F3>', '<Plug>VimspectorStop', {buffer = true})
--       vim.keymap.set('n', '<F4>', '<Plug>VimspectorRestart', {buffer = true})
--       vim.keymap.set('n', '<F5>', '<Plug>VimspectorContinue', {buffer = true})
--       vim.keymap.set('n', '<F6>', '<Plug>VimspectorPause', {buffer = true})
--       vim.keymap.set('n', '<F8>', '<Plug>VimspectorAddFunctionBreakpoint', {buffer = true})
--       vim.keymap.set('n', '<leader><F8>', '<Plug>VimspectorRunToCursor', {buffer = true})
--       vim.keymap.set('n', '<F9>', '<Plug>VimspectorToggleBreakpoint', {buffer = true})
--       vim.keymap.set('n', '<leader><F9>', '<Plug>VimspectorToggleConditionalBreakpoint', {buffer = true})
--       vim.keymap.set('n', '<F10>', '<Plug>VimspectorStepOver', {buffer = true})
--       vim.keymap.set('n', '<F11>', '<Plug>VimspectorStepInto', {buffer = true})
--       vim.keymap.set('n', '<F12>', '<Plug>VimspectorStepOut', {buffer = true})
--     end,
--   }
-- )

-- Debugging with `nvim-dap`.
local dap_keymap = api.nvim_create_augroup('dap_keymap', {clear = true})
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'c', 'cpp', 'python', 'rust'},
    group = dap_keymap,
    callback = function()
      vim.keymap.set('n', '<F5>', ':lua require("dap").continue()<CR>', {buffer = true})
      vim.keymap.set('n', '<F6>', ':lua require("dap").pause()<CR>', {buffer = true})
      vim.keymap.set('n', '<F9>', ':lua require("dap").toggle_breakpoint()<CR>', {buffer = true})
      vim.keymap.set('n', '<F10>', ':lua require("dap").step_over()<CR>', {buffer = true})
      vim.keymap.set('n', '<F11>', ':lua require("dap").step_into()<CR>', {buffer = true})
      vim.keymap.set('n', '<F12>', ':lua require("dap").step_out()<CR>', {buffer = true})
      vim.keymap.set('n', '<leader>r', ':lua require("dap").repl.open()<CR>', {buffer = true})
    end,
  }
)
