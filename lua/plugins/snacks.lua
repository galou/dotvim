-- A collection of small Quality-of-Life plugins for Neovim.
-- https://github.com/folke/snacks.nvim
return {
{
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  ---@type Snacks.Config
  opts = {
    -- Featues.
    bigfile = { enabled = true },  -- Deactivate IDE functions on big files.
    dashboard = { enabled = true },  -- Dashboard on Neovim entry.
    dim = { enabled = false },  -- Focus on the active scope by dimming the rest.
    indent = { enabled = false },  -- Indentation guides.
    input = { enabled = false },  -- Better vim.ui.input.
    layout = { enabled = false },  -- Window layout.
    notifier = {  -- Pretty vim.notify.
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = false },
    quickfile = { enabled = true },  -- Render the file before loading your plugins.
    scope = { enabled = false },  -- Scope-based jumping.
    scroll = { enabled = false },  -- Smooth scrolling.
    statuscolumn = {
      enabled = false,
      left = false,
    },  -- Pretty status column.
    toggle = { enabled = true },  -- Toggle options.
    words = { enabled = false },  -- Auto-show LSP references and quickly navigate between them.
    zen = { enabled = false },  -- Zen mode (distraction-free coding).

    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    -- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    -- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<leader>ss",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>sS",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    -- { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>sf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>sg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>sl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<leader>sn", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    { "]u",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[u",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        -- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        -- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        -- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        -- Snacks.toggle.diagnostics():map("<leader>ud")
        -- Snacks.toggle.line_number():map("<leader>ul")
        -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
        -- Snacks.toggle.treesitter():map("<leader>uT")
        -- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        -- Snacks.toggle.inlay_hints():map("<leader>uh")
        -- Snacks.toggle.indent():map("<leader>ug")
        -- Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
}
