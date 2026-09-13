vim.g.font_size = 12

local function inc_font ()
    vim.g.font_size = vim.g.font_size + 1
    vim.o.guifont = "JetBrainsMono Nerd Font:h" .. vim.g.font_size
end

local function dec_font ()
    vim.g.font_size = vim.g.font_size - 1
    vim.o.guifont = "JetBrainsMono Nerd Font:h" .. vim.g.font_size
end

local function inc_trans ()
    vim.g.neovide_opacity = vim.g.neovide_opacity + 0.1
end

local function dec_trans ()
    vim.g.neovide_opacity = vim.g.neovide_opacity - 0.1
end

if vim.g.neovide then
    vim.g.neovide_opacity = 0.7
    local wk = require("which-key")

    wk.add({
        {"<leader>gl", inc_font, desc = "Increase font size", mode = "n"},
        {"<leader>g;", dec_font, desc = "Decrease font size", mode = "n"},
        {"<leader>gn", inc_trans, desc = "Increase font size", mode = "n"},
        {"<leader>go", dec_trans, desc = "Increase font size", mode = "n"},
    })
end
