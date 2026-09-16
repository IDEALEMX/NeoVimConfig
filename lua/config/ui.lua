-- Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Tab sizes
vim.o.expandtab = true

vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

vim.o.smartindent = true

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Case
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.laststatus = 3

-- Scroll max
vim.o.scrolloff = 8

-- Smooth scrooll
vim.o.smoothscroll = true

-- Cmdline
vim.o.cmdheight = 0

-- Visual feedback when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Add a highlight for visual feedback when yanking",
    callback = function ()
        vim.hl.on_yank()
    end
})

-- Colors
vim.o.termguicolors = true
vim.cmd("colorscheme paramount")

-- Save undo
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

-- Enable clipboard
vim.opt.clipboard = "unnamedplus"

-- Set FzfLua as ui select
require("fzf-lua").register_ui_select()

-- Terminal colors
-- Set terminal colors dynamically based on the current colorscheme
local function set_terminal_colors()
  local function get_hl(name, attr)
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
    if ok and hl and hl[attr] then
      return string.format('#%06x', hl[attr])
    end
    return nil
  end

  -- Fallback chain: try several highlight groups until one has the attribute we want
  local function pick(specs)
    for _, spec in ipairs(specs) do
      local color = get_hl(spec[1], spec[2])
      if color then return color end
    end
    return nil
  end

  local normal_fg = pick({ { 'Normal', 'fg' } }) or '#d8dee9'
  local normal_bg = pick({ { 'Normal', 'bg' } }) or '#2e3440'

  local colors = {
    [0]  = pick({ { 'Normal', 'bg' }, { 'NormalFloat', 'bg' } }) or normal_bg,
    [1]  = pick({ { 'DiagnosticError', 'fg' }, { 'ErrorMsg', 'fg' }, { 'Error', 'fg' } }),
    [2]  = pick({ { 'String', 'fg' }, { 'DiagnosticOk', 'fg' } }),
    [3]  = pick({ { 'DiagnosticWarn', 'fg' }, { 'WarningMsg', 'fg' }, { 'Todo', 'fg' } }),
    [4]  = pick({ { 'string', 'fg' }, { 'Directory', 'fg' } }),
    [5]  = pick({ { 'Statement', 'fg' }, { 'Special', 'fg' } }),
    [6]  = pick({ { 'Type', 'fg' }, { 'Identifier', 'fg' } }),
    [7]  = normal_fg,
    [8]  = pick({ { 'Comment', 'fg' }, { 'NonText', 'fg' } }),
    [9]  = pick({ { 'DiagnosticError', 'fg' }, { 'ErrorMsg', 'fg' } }),
    [10] = pick({ { 'String', 'fg' }, { 'DiagnosticOk', 'fg' } }),
    [11] = pick({ { 'DiagnosticWarn', 'fg' }, { 'WarningMsg', 'fg' } }),
    [12] = pick({ { 'Function', 'fg' }, { 'Directory', 'fg' } }),
    [13] = pick({ { 'Statement', 'fg' }, { 'Special', 'fg' } }),
    [14] = pick({ { 'Type', 'fg' }, { 'Identifier', 'fg' } }),
    [15] = normal_fg,
  }

  for i, color in pairs(colors) do
    if color then
      vim.g['terminal_color_' .. i] = color
    end
  end
end

-- Run immediately, and again whenever the colorscheme changes
set_terminal_colors()

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = set_terminal_colors,
  desc = 'Sync terminal colors with active colorscheme',
})

-- Which key ui tweaks
vim.api.nvim_set_hl(0, "WhichKeyIcon", { underline = false })
