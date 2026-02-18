-- Provide some installation scripts for some LSP servers, DAP servers,
-- https://github.com/mason-org/mason.nvim
-- linters, and formatters.
-- https://github.com/mason-org/mason.nvim
-- Replacement for 'williamboman/nvim-lsp-installer'
-- Alternative: https://github.com/dundalek/lazy-lsp.nvim.
return {
{
  'mason-org/mason.nvim',
    -- event = {'BufEnter', 'BufRead'},
    lazy = false,
    opts = {
      ensure_installed = {
        "bashls",  -- bash (`:LspInstall bashls` or `npm i -g bash-language-server`)
        "biome",  -- Javascript, Typescript (`:LspInstall biome`)
        -- "clangd",  -- C,C++ (:LspInstall), configured in clangd_extensions.lua.
        "cmake",  -- cmake (`LspInstall cmake` or `pip3 install cmake-language-server`)
        "cssls",  -- CSS (LspInstall cssls)
        "dockerls", -- dockerfile (`LspInstall dockerls` or `npm install -g dockerfile-language-server-nodejs`)
        "dotls", -- Graphviz dot (https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally, then `npm i -g dot-language-server`)
        "gopls", -- Go (GO111MODULE=on go get golang.org/x/tools/gopls@latest) or sudo snap install gopls
        "jedi_language_server",  -- Python (`:LspInstall jedi_language_server`).
        "jsonls", -- :LspInstall jsonls.
        "lemminx", -- xml, (https://github.com/eclipse/lemminx.git, :LspInstall lemminx).
        "ltex",  -- LaTeX, Markdown, and others (:LspInstall ltex)
        "lua_ls",  -- Lua, installed by mason.
        "mojo",  -- Mojo (modular install mojo).
        "ruff", -- Python (https://docs.astral.sh/ruff/, :LspInstall ruff)
        "rust_analyzer", -- Rust (rustup +nightly component add rust-analyzer-preview)
        "spectral", -- yaml (:LspInstall spectral)
        "texlab", -- LaTeX, (lua/lspinstall/servers/latex.lua from https://github.com/kabouzeid/nvim-lspinstall.git, :LspInstall texlab)
        "tinymist",  -- Typst (:LspInstall tinymist)
      },
    },
},
}
