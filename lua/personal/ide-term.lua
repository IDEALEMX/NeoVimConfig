local M = {}

M.setup = function (opts)
    M.width = opts.width
    M.height = opts.height
end

M.create_term_buf = function ()
    M.bufn = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_buf_call(M.bufn, function ()
        --vim.fn.termopen(vim.o.shell)
        vim.cmd(":terminal")
        vim.cmd("normal! A")
        vim.keymap.set("n", "<F4>", "<C-w>c", {buffer = M.bufn})
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = M.bufn,
            callback = function()
                M.bufn = nil
            end,
})
    end)
end

M.showterm = function ()
    if not M.bufn then
        M.create_term_buf()
    end

    local col = math.floor((vim.o.columns - M.width) / 2)
    local row = math.floor((vim.o.lines - M.height) / 2)

    local opts = {
        relative = 'editor',
        width = M.width,
        height = M.height,
        col = col,
        row = row,
        style = 'minimal',
        border = 'rounded',
    }

    local _ = vim.api.nvim_open_win(M.bufn, true, opts)
    vim.cmd("normal! A")
end

return M
