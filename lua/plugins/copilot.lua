return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          next = "<C-n>",
          prev = "<C-p>",
          dismiss = "<C-]>",
          trigger = "<C-;>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          open = "<F3>",
          accept = "<CR>",
          refresh = "r",
          next = "j",
          prev = "k",
          close = "<Esc>",
        },
      },
      filetypes = {
        markdown = true,
        help = false,
        gitcommit = true,
        gitrebase = true,
        ["."] = false,
      },
    },
  },
}
