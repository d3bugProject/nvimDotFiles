local key = vim.keymap.set
local opt = { noremap = true, silent = true }

-----------------------------------------------------------------
-- controle de fichier
------------------------------------------------------------------
-- enregitrer tout les fichiers
key("n", "e", ":wa<CR>", opt)
-- enregistrer et quitter neovim
key("n", "Q", ":wqa<CR>", opt)
--
--
