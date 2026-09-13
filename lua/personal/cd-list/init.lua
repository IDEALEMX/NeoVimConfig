local M = {}

local dirs = {""}
M.setup = function(opts)
    dirs = opts.content
end

M.open = function ()
    if dirs  == "" then
        vim.notify("No cd list found!", vim.log.levels.ERROR)
    end

    vim.ui.select(dirs, {
        prompt = "Set CWD: "
    }, function (choice)
        vim.cmd("cd " .. choice)
        vim.notify("Set cwd: " .. choice)
    end)
end

return M
