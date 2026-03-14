return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    ft = { "dart" },
    opts = function(_, opts)
      opts.decorations = {
        statusline = {
          app_version = false,
          device = true,
        },
      }
      opts.debugger = {
        enabled = false,
      }
      opts.dev_log = {
        enabled = true,
        filter = nil, -- optional callback to filter the log
        -- takes a log_line as string argument; returns a boolean or nil;
        -- the log_line is only added to the output if the function returns true
        notify_errors = false, -- if there is an error whilst running then notify the user
        open_cmd = "7split", -- command to use to open the log buffer
        focus_on_open = true, -- focus on the newly opened log window
      }
      opts.dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      }
      opts.outline = {
        open_cmd = "30vnew", -- command to use to open the outline buffer
        auto_open = false, -- if true this will open the outline automatically when it is first populated
      }
    end,
  }, -- add lsp plugin
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(plugin, opts)
      opts.servers = opts.servers or {}
      table.insert(opts.servers, "dartls")

      opts = require("astrocore").extend_tbl(opts, {
        config = {
          dartls = {
            -- any changes you want to make to the LSP setup, for example
            color = {
              enabled = true,
            },
            settings = {
              showTodos = true,
              completeFunctionCalls = true,
            },
          },
        },
      })
    end,
  },
}
