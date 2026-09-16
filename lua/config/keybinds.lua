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

-- Sorround
local tovisual_prefix = "v_<Esc>v$h"
wk.add({
    {"<leader>s", group = "Sorround", mode = {"n", "v"}},

    {"<leader>si", group = "Inside", mode = {"n", "v"}},

    {"<leader>sa", group = "Around", mode = {"n", "v"}},

    {'<leader>siq', 'c"<C-r>""<Esc>', desc = "Quotes", mode = "v"},
    {'<leader>saq', 'c" <C-r>" "<Esc>', desc = "Quotes", mode = "v"},

    {'<leader>siq', tovisual_prefix .. 'c"<C-r>""<Esc>', desc = "Quotes", mode = "n"},
    {'<leader>saq', tovisual_prefix .. 'c" <C-r>" "<Esc>', desc = "Quotes", mode = "n"},

    {'<leader>siq', tovisual_prefix .. 'c"<C-r>""<Esc>', desc = "Quotes", mode = "n"},
    {'<leader>saq', tovisual_prefix .. 'c" <C-r>" "<Esc>', desc = "Quotes", mode = "n"},

    {'<leader>sic', 'c{<C-r>"}<Esc>', desc = "Curly braces", mode = "v"},
    {'<leader>sac', 'c{ <C-r>" }<Esc>', desc = "Curly braces", mode = "v"},

    {'<leader>sic', tovisual_prefix .. 'c{<C-r>"}<Esc>', desc = "Curly braces", mode = "n"},
    {'<leader>sac', tovisual_prefix .. 'c{ <C-r>" }<Esc>', desc = "Curly braces", mode = "n"},

    {'<leader>sis', 'c[<C-r>"]<Esc>', desc = "Square braces", mode = "v"},
    {'<leader>sas', 'c[ <C-r>" ]<Esc>', desc = "Square braces", mode = "v"},

    {'<leader>sis', tovisual_prefix .. 'c[<C-r>"]<Esc>', desc = "Square braces", mode = "n"},
    {'<leader>sas', tovisual_prefix .. 'c[ <C-r>" ]<Esc>', desc = "Square braces", mode = "n"},

    {'<leader>sib', 'c(<C-r>")<Esc>', desc = "Braces", mode = "v"},
    {'<leader>sab', 'c( <C-r>" )<Esc>', desc = "Braces", mode = "v"},

    {'<leader>sib', tovisual_prefix .. 'c(<C-r>")<Esc>', desc = "Braces", mode = "n"},
    {'<leader>sab', tovisual_prefix .. 'c( <C-r>" )<Esc>', desc = "Braces", mode = "n"},

    {'<leader>sit', 'c<%%-!%%><C-r>"</%%-!%%><Esc>:%s/%%-!%%//g<Left><Left>', desc = "Tags", mode = "v"},
    {'<leader>sat', 'c<%%-!%%><CR><C-r>"<CR></%%-!%%><Esc>:%s/%%-!%%//g<Left><Left>', desc = "Tags", mode = "v"},

    {'<leader>sit', tovisual_prefix .. 'c<%%-!%%><C-r>"</%%-!%%><Esc>:%s/%%-!%%//g<Left><Left>', desc = "Tags", mode = "n"},
    {'<leader>sat', tovisual_prefix .. 'c<%%-!%%><CR><C-r>"<CR></%%-!%%><Esc>:%s/%%-!%%//g<Left><Left>', desc = "Tags", mode = "n"},
})

wk.add({
    {"<leader>r", ":%s/", desc="Replace"},
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

vim.keymap.set("v", "<leader>l", "_<Esc>v$h", { desc="select full line wo \\n"})

-- Terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })
