local function open_tui(cmd, direction)

  local buf = vim.api.nvim_create_buf(true, true)

  local win = vim.api.nvim_open_win(buf, true, {split = direction})

  vim.fn.termopen(cmd, {
    on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  vim.cmd("startinsert")
end

local M = {}

local dirs = {"nmtui", "vim"}
M.setup = function(opts)
    dirs = opts.content
end

M.open = function (vertical)
    if dirs  == {""} then
        vim.notify("No cd list found!", vim.log.levels.ERROR)
    end

    vim.ui.input({prompt = "Launch: "}, function (input)
        if input == "" then
            return
        end

        if vertical then
            open_tui(input, "right")
            return
        end
        open_tui(input, "below")
    end)
end

return M
