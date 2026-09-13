return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
      vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "none" })
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
