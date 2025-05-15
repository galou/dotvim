-- WYSIWYG Markdown editor.
-- https://github.com/iamcco/markdown-preview.nvim

return
{
  {
    'iamcco/markdown-preview.nvim',
    build = function(plugin)
      if vim.fn.executable "npx" then
        -- Build with `npx` is available.
        vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
      else
        -- Fallback to `mkdp#util#install` but may fail if :Lazy itself is not available.
        vim.cmd [[Lazy load markdown-preview.nvim]]
        vim.fn["mkdp#util#install"]()
      end
    end,
    init = function()
      if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
    end,
    cmd = {
      'MarkdownPreview',
      'MarkdownPreviewStop',
      'MarkdownPreviewToggle',
    },
    ft = {'markdown'},
  },
}
