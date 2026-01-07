-- Configuration of LSP servers.

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- Installation with Mason: `:LspInstall bashls biome cmake ccsls dockerls jedi_language_server jsonls lemminx ltex lua_ls spectral texlab`
--   `ruff` is installed globally.
--   `dartls` is set-up by flutter-tools.nvim.
local servers = {
  "bashls",  -- bash (`:LspInstall bashls` or `npm i -g bash-language-server`)
  "biome",  -- Javascript, Typescript (`:LspInstall biome`)
  "clangd",  -- C,C++ (:LspInstall), configured in clangd_extensions.lua.
  "cmake",  -- cmake (`LspInstall cmake` or `pip3 install cmake-language-server`)
  "cssls",  -- CSS (LspInstall cssls)
  "dockerls", -- dockerfile (`LspInstall dockerls` or `npm install -g dockerfile-language-server-nodejs`)
  "dotls", -- Graphviz dot (https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally, then `npm i -g dot-language-server`)
  "gopls", -- Go (GO111MODULE=on go get golang.org/x/tools/gopls@latest) or sudo snap install gopls
  -- "jedi_language_server",  -- Python (`:LspInstall jedi_language_server`).
  "jsonls", -- :LspInstall jsonls.
  "kulala_ls",  -- REST Client (npm install -g @mistweaverco/kulala-ls)
  "lemminx", -- xml, (https://github.com/eclipse/lemminx.git, :LspInstall lemminx).
  "ltex",  -- LaTeX, Markdown, and others (:LspInstall ltex)
  "lua_ls",  -- Lua, installed by mason.
  "mojo",  -- Mojo (modular install mojo).
  -- "pyrefly",  -- Python (:LspInstall pyrefly)
  "ruff", -- Python (https://docs.astral.sh/ruff/, :LspInstall ruff)
  "rust_analyzer", -- Rust (rustup +nightly component add rust-analyzer-preview)
  "spectral", -- yaml (:LspInstall spectral)
  "texlab", -- LaTeX, (lua/lspinstall/servers/latex.lua from https://github.com/kabouzeid/nvim-lspinstall.git, :LspInstall texlab)
  "tinymist",  -- Typst (:LspInstall tinymist)
  -- "yamlls" -- yaml (npm i -g yaml-language-server)
}
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
