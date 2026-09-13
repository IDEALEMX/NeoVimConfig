local M = {}

M.setup = function()
    vim.g.zen_mode = false
end

M.toggle = function()
    vim.g.zen_mode = not vim.g.zen_mode
    
    if vim.g.zen_mode then
        vim.o.laststatus = 0
        vim.o.showtabline = 0
    else
        vim.o.laststatus = 3
        vim.o.showtabline = 1
    end
end

return M
