-- Configuration for https://github.com/nvim-treesitter/nvim-treesitter.

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cmake",
    "cpp",
    "dockerfile",
    "dot",
    "go",
    "html",
    "json",
    "julia",
    "latex",
    "lua",
    "make",
    "markdown",
    "ninja",
    "python",
    "regex",
    "rst",
    "rust",
    "toml",
    "vim",
    "yaml",
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = false,  -- Doens't work well.
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  nt_cpp_tools = {
    enable = true,
    preview = {
      quit = 'q', -- optional keymapping for quit preview
      accept = '<tab>' -- optional keymapping for accept preview
    },
  },

}

-- Use the html parser for xml files.
vim.treesitter.language.register('html', 'xml')
