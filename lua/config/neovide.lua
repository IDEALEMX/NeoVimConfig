local font_size = 12
local last_func = function ()
    vim.notify("No function yet!", vim.log.levels.WARN)
end

local function inc_font ()
    font_size = font_size + 1
    vim.o.guifont = "JetBrainsMono Nerd Font:h" .. font_size
    last_func = inc_font
end

local function dec_font ()
    font_size = font_size - 1
    vim.o.guifont = "JetBrainsMono Nerd Font:h" .. font_size
    last_func = dec_font
end

local function inc_trans ()
    vim.g.neovide_opacity = vim.g.neovide_opacity + 0.1
    last_func = inc_trans
end

local function dec_trans ()
    vim.g.neovide_opacity = vim.g.neovide_opacity - 0.1
    last_func = inc_trans
end

if vim.g.neovide then
    vim.g.neovide_opacity = 0.7
    local wk = require("which-key")

    wk.add({
        {"<leader>gj", function ()
            inc_font()
        end, desc = "Increase font size", mode = "n"},

        {"<leader>g;", function ()
            dec_font()
        end, desc = "Decrease font size", mode = "n"},

        {"<leader>gm", function ()
            inc_trans()
        end, desc = "Increase font size", mode = "n"},

        {"<leader>go", function ()
            dec_trans()
        end, desc = "Increase font size", mode = "n"},

        {"<leader>g.", function ()
           last_func()
        end, desc = "Last gui func", mode = "n"},
    })
end
