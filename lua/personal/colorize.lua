--- Colors ---

local PURPLE = {
    light_accent = "#cc99ff",
    accent = "#9500ff",
    dark_accent = "#220033",

    bg = "#000000",
    dim = "#3a3442",
    light_gray = "#d9cfe6",
    white = "#f1edff",

    warning = "#ff00ff",
    error = "#ff00aa",
}

local LOW_PURPLE = {
    light_accent = "#c7a6e8",
    accent = "#8746b8",
    dark_accent = "#2d1738",

    bg = "#000000",
    dim = "#39333f",
    light_gray = "#cfc6d8",
    white = "#e9e3ed",

    warning = "#d58bbf",
    error = "#d16a91",
}

local TOP = {
    light_accent = "#e45b4f",
    accent = "#f41e2a",
    dark_accent = "#52151b",

    bg = "#100000",
    dim = "#3b3a36",
    light_gray = "#c9c5b8",
    white = "#e8e4d8",

    warning = "#d8a928",
    error = "#c91f2a",
}

local GRUVBOX = {
    light_accent = "#d8a657",
    accent = "#d8a657",
    dark_accent = "#7c5c20",

    bg = "#050500",
    dim = "#504945",
    light_gray = "#bdae93",
    white = "#d4be98",

    warning = "#d8a657",
    error = "#ea6962",
}

local colors = TOP

require('base16-colorscheme').setup({
    base00 = colors.bg, base01 = colors.dim, base02 = colors.dark_accent, base03 = colors.light_accent,
    base04 = colors.dim, base05 = colors.light_gray, base06 = colors.light_accent, base07 = colors.accent,
    base08 = colors.error, base09 = colors.warning, base0A = colors.warning, base0B = colors.light_accent,
    base0C = colors.white, base0D = colors.white, base0E = colors.accent , base0F = colors.warning,
})

require("lualine").setup({
    options = {
        theme = {
            normal = {
                a = { fg = colors.white, bg = colors.accent, gui = "bold" },
                b = { fg = colors.white, bg = colors.dim },
                c = { fg = colors.light_gray, bg = colors.bg },
            },

            insert = {
                a = { fg = colors.bg, bg = colors.warning, gui = "bold" },
                b = { fg = colors.white, bg = colors.dim },
                c = { fg = colors.light_gray, bg = colors.bg },
            },

            visual = {
                a = { fg = colors.bg, bg = colors.light_accent, gui = "bold" },
                b = { fg = colors.white, bg = colors.dim },
                c = { fg = colors.light_gray, bg = colors.bg },
            },

            replace = {
                a = { fg = colors.white, bg = colors.error, gui = "bold" },
                b = { fg = colors.white, bg = colors.dim },
                c = { fg = colors.light_gray, bg = colors.bg },
            },

            command = {
                a = { fg = colors.bg, bg = colors.warning, gui = "bold" },
                b = { fg = colors.white, bg = colors.dim },
                c = { fg = colors.light_gray, bg = colors.bg },
            },

            inactive = {
                a = { fg = colors.dim, bg = colors.bg },
                b = { fg = colors.dim, bg = colors.bg },
                c = { fg = colors.dim, bg = colors.bg },
            },
        },
    },
})

-- Config paths
local paths = {
    wallpaper = os.getenv("HOME") .. "/Downloads/wals/bw-foxgirl.png",
    --wallpaper = os.getenv("HOME") .. "~/Downloads/wals/tardis.png",
    colorwal_script = os.getenv("HOME") .. "/bash/colorwal",
    hyprland = os.getenv("HOME") .. "/.config/hypr/hyprland.lua",
    fuzzle = os.getenv("HOME") .. "/.config/fuzzel/fuzzel.ini",
}

--- Utils ---
local function replace_in_file(path, replacements)
    local file = assert(io.open(path, "r"))
    local content = file:read("*a")
    file:close()

    for search, replace in pairs(replacements) do
        content = content:gsub(search, replace)
    end

    file = assert(io.open(path, "w"))
    file:write(content)
    file:close()
end

replace_in_file(paths.hyprland, {
    ['local accent = ".-"\n'] = 'local accent = "' .. colors.accent .. '"\n',
    ['local dim = ".-"\n'] = 'local dim = "' .. colors.dim .. '"\n',
})

replace_in_file(paths.fuzzle, {
    [' text=.-\n'] = ' text=' .. colors.white .. "ff\n",
    [' prompt=.-\n'] = ' prompt=' .. colors.accent .. "ff\n",
    [' border=.-\n'] = ' border=' .. colors.accent .. "ff\n",
    [' selection.match=.-\n'] = ' selection-match=' .. colors.warning .. "ff\n",
    [' match=.-\n'] = ' match=' .. colors.accent .. "ff\n",
    [' selection=.-\n'] = ' selection=' .. colors.dark_accent .. "ff\n",
    [' selection.text=.-\n'] = ' selection-text=' .. colors.white .. "ff\n",
    [' input=.-\n'] = ' input=' .. colors.white .. "ff\n",
})

os.execute(paths.colorwal_script .. " " .. paths.wallpaper .. " '" .. colors.accent .. "'")
