local wk = require("which-key")
wk.add({{"<leader>l", group = "Local plugins", icon = {icon = " ", color = "purple"}}})

-- Zen mode
local zm = require("personal.zen-mode")

wk.add({
    {"<leader>lz", zm.toggle, desc = "Toggle zen mode", mode = "n"},
})

-- Cd list
local cl = require("personal.cd-list.init")

cl.setup({
    content = {
        "~/.config/nvim/",
        "~/.config/",
        "~/upekshitam/"
    }})

wk.add({
    {"<leader>lc", cl.open, desc = "Open cd list", mode = "n"},
})

local it = require("personal.ide-term")

it.setup({
    width = math.floor(vim.o.columns * (4/6)),
    height = math.floor(vim.o.lines * (4/6))
})

wk.add({
    {"<leader>lt", it.showterm, desc = "Open terminal buffer", mode = "n"},
})

local pl = require("personal.prog-launcher")

wk.add({
    {"<leader>lv", function ()
        pl.open(true)
    end, desc = "Launch prog as vsplit", mode = "n"},
    {"<leader>ls", function ()
        pl.open(false)
    end, desc = "Launch prog as split", mode = "n"},
})

local ev = require("personal.eval")
wk.add({
    {"<leader>led", function ()
        ev.define_cmd()
    end, desc = "Launch prog as vsplit", mode = "n"},
    {"<leader>lev", function ()
        ev.eval()
    end, desc = "Launch prog as split", mode = "n"},
})

