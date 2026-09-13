vim.g.mapleader = " "

local wk = require("which-key")

-- Lua eval
wk.add({
    {"<leader>e", ":lua<CR>", desc = "Eval lua code", mode = "v"},
    {"<leader>e", ":% lua<CR>", desc = "Eval lua code", mode = "n"},
})

-- Find
wk.add({
    {"<leader>f", group = "Find"},

    {"<leader>ff", ":FzfLua files<CR>", desc = "File", mode = "n"},

    {"<leader>fo", ":Oil<CR>", desc = "Oil", mode = "n"},
    {"<leader>fc", ":FzfLua colorschemes<CR>", desc = "Oil", mode = "n"},
    {"<leader>fg", ":FzfLua grep_visual<CR>", desc = "Grep", mode = "n"},
    {"<leader>fh", ":FzfLua history<CR>", desc = "History", mode = "n"},
    {"<leader>fr", ":FzfLua registers<CR>", desc = "Registers", mode = "n"},
    {"<leader>fs", ":FzfLua spellcheck<CR>", desc = "Spellcheck", mode = "n"},
})

-- Buffers
wk.add({
    {"<leader>b", group = "Buffer"},

    {"<leader>bf", ":FzfLua buffers<CR>", desc = "Find", mode = "n"},
    {"<leader>bk", ":bd<CR>", desc = "Kill", mode = "n"},
    {"<leader>bn", ":bnext<CR>", desc = "Next", mode = "n"},
})

-- Window
wk.add({
    {"<leader>w", group = "Window"},

    {"<leader>wk", "<C-w>q", desc = "Kill", mode = "n"},
    {"<leader>wn", "<C-w>w", desc = "Next", mode = "n"},

    {"<leader>wv", "<C-w>v", desc = "Vertical", mode = "n"},
    {"<leader>ws", "<C-w>s", desc = "Split", mode = "n"},
})

-- Tab
wk.add({
    {"<leader>t", group = "Tab"},

    {"<leader>tk", ":tabclose<CR>", desc = "Kill", mode = "n"},
    {"<leader>tn", ":tabnext<CR>", desc = "Next", mode = "n"},

    {"<leader>ta", ":tabnew<CR>", desc = "Add", mode = "n"},
})

-- Qol
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc="Remove highlights form previous search", silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc="Move lines down in visual selection"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc="Move lines up in visual selection"})

vim.keymap.set("v", "<", "<gv", { desc="Unindent and keep selection"})
vim.keymap.set("v", ">", ">gv", { desc="Indent and keep selection"})

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc="Page up and center"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc="Page down and center"})

vim.keymap.set("n", "n", "nzzzv", { desc="Next and center"})
vim.keymap.set("n", "N", "Nzzzv", { desc="Prev and center"})
