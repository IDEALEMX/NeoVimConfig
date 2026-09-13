# Require wk
``` lua
local wk = require("which-key")
```

# Add a keybind
``` lua
wk.add({
  { "<leader>f", group = "file" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" }})
```

# Buffer local keybind
``` lua
require("which-key").add({
        { "<leader>c", desc = "Buffer command" },
        }, { buffer = 0 })
```
