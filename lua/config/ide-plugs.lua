local wk = require("which-key")
wk.add({{"<leader>l", group = "Local plugins"}})

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
        "~/upekshitam/"
    }})

wk.add({
    {"<leader>lc", cl.open, desc = "Open cd list", mode = "n"},
})
