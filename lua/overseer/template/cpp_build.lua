-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
    name = "g++ build",
    builder = function()
        -- Full path to current file (see :help expand())
        local file = vim.fn.expand("%:p")
        local outfile = vim.fn.expand("%:p:r") .. ".out"
        return {
            cmd = { "kitty"},
            args = { "zsh", "-c", outfile .. "; exec zsh" },
            components = {
                { "dependencies", task_names = { { cmd = "g++", args = { file, "-o", outfile } } } },
                { "on_output_quickfix", open = false },
                "default"
            },
        }
    end,
    condition = {
        filetype = { "cpp" },
    },
}
