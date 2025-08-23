local key = vim.keymap.set
local opt = { noremap = true, silent = true }

-----------------------------------------------------------------
-- controle de fichier
------------------------------------------------------------------
-- enregitrer tout les fichiers
key("n", "<leader>rf", ':%s/{" "}//<CR>', opt)
