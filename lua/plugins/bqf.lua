-- Better quickfix window
-- https://github.com/kevinhwang91/nvim-bqf
--
-- Improve layout and preview of the Quickfix window.
-- Shortcuts:
--   t: open in a new tab
--   T: open in a new tab, keep quickfix open
--   crtl-v: open in a new vertical split
--   crtl-x: open in a new horizontal split
--   <: previous quickfix list
--   >: next quickfix list
--   p: toggle preview (P: temporarily)
--   zf: open fzf
--   crtl-t: in fzf, open in a new tab
--   crtl-v: in fzf, open in a new vertical split
--   crtl-x: in fzf, open in a new horizontal split

return {
  {
    'kevinhwang91/nvim-bqf',
    opts = {
      auto_resize_height = true,
      preview_height_ratio = 0.4,
      preview_auto_focus = false,
      func_map = {
        ptogglemode = 'P',
        stogglemode = 'S',
        fzf = 'zf',
      },
    },
    config = function(_, opts)
      require('bqf').setup(opts)
      vim.api.nvim_create_autocmd('FileType', { pattern = 'qf', command = 'set nobuflisted' })
    end,
    event = 'VeryLazy',
  },
}
