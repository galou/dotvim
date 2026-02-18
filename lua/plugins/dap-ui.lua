-- UI extension for 'nvim-dap'
-- Configured also in `neodev.lua`.
-- `:lua require("dapui").open()`.
return {
{
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  ft = {'c', 'cpp', 'rust', 'python'},
  after = 'nvim-dap',
  config = function()
    require('dapui').setup({})
    local dap = require('dap')
    local dapui = require('dapui')
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
},
}
