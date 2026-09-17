local M = {}
M.evals = {}

M.define_cmd = function()
    vim.ui.input({prompt = "eval cmd: ", completion = "shellcmd"}, function (input)
        if input then
            local bufn = vim.api.nvim_win_get_buf(0)
            local cwd = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h") .. "/"
            M.evals[bufn] = {
                cmd = input,
                cwd = cwd
            }
        end
    end)
end

M.eval = function ()
    local bufn = vim.api.nvim_win_get_buf(0)
    local obj = M.evals[bufn]
    if obj then
        os.execute(
            "bash -ic " .. vim.fn.shellescape(
                "cd " .. obj.cwd .. " && " ..
                obj.cmd:gsub("%./", obj.cwd)
            ))
        return
    end

    os.execute(
        "bash -ic " .. vim.fn.shellescape(
            "hyprmsg 5 'No cmd has been defined'"
        ))
end

return M
