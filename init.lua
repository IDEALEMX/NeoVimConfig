require("config.lazy")

-- Personal config
require("config.ui")
require("config.keybinds")
require("config.lsp")
require("config.ide-plugs")
require("config.neovide")
require("config.behaviour")

-- setup socket
local socket_path = '/tmp/nvim.sock'

if vim.loop.fs_stat(socket_path) then
    os.remove(socket_path)
end

local ok, err = pcall(vim.fn.serverstart, socket_path)
if not ok then
    vim.notify('serverstart failed: ' .. tostring(err), vim.log.levels.ERROR)
else
end

-- colorize
vim.schedule(function()
    require("personal.colorize")
    vim.o.laststatus = 3
end)
