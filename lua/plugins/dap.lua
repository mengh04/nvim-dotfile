return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    -- CHANGE THIS to your path!
                    command = 'D:\\dev\\codelldb\\extension\\adapter\\codelldb',
                    args = { "--port", "${port}" },

                    -- On windows you may have to uncomment this:
                    -- detached = false,
                }
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    -- program = function()
                    --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    -- end,
                    program = '${workspaceFolder}' .. '/debug.exe',
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }
        end
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")


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
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text'
    }
}
