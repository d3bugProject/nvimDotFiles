local key = vim.keymap.set
local opt = { noremap = true, silent = true }

---Controle sur buffers
key("n", "<Tab>", ":bnext<CR>", opt)
key("n", "x", ":bdelete<CR>", opt)
key("n", "X", ":bufdo bd<CR>", opt)
key("n", "XX", ":%bd|e#|bd#<CR>", opt)
