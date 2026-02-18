-- https://github.com/chomosuke/typst-preview.nvim
return {
{
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  opts = {
    -- Provide the path to binaries for dependencies.
    -- Setting this will skip the download of the binary by the plugin.
    -- Warning: Be aware that your version might be older than the one
    -- required.
    dependencies_bin = {
      ['tinymist'] = 'tinymist',  -- should point towards the Mason installation of tinymist.
    },
  }, -- lazy.nvim will implicitly calls `setup {}`
}
}
