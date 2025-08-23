-- ======================================================
-- OPTIONS NEOVIM - Configuration générale
-- ======================================================

-- Active le presse-papiers système (copier/coller entre Neovim et OS)
vim.opt.clipboard = "unnamedplus"

-- Options supplémentaires utiles pour le développement JS/TS
vim.opt.expandtab = true -- Utilise des espaces au lieu des tabs
vim.opt.shiftwidth = 2 -- Indentation de 2 espaces
vim.opt.tabstop = 2 -- Tab = 2 espaces
vim.opt.softtabstop = 2 -- Tab en mode insertion = 2 espaces
-- Numéros de ligne
vim.opt.number = true -- Numéros de ligne
vim.opt.relativenumber = false -- Numéros relatifs
-- Recherche
vim.opt.ignorecase = true -- Ignore la casse dans la recherche
vim.opt.smartcase = true -- Mais la respecte si majuscule présente
-- Affichage des indentations et espaces
vim.opt.list = true -- Active l'affichage des caractères invisibles
vim.opt.listchars = {
  tab = "  ", -- Tabs invisibles
  --space = "·",              -- Espaces avec points discrets
  trail = " ", -- Espaces en fin de ligne
  extends = "…", -- Plus discret
  precedes = "…",
}

vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#268bd2", fg = "#002b36", bold = true })
vim.api.nvim_set_hl(0, "SolarizedOsakaNormal", { bg = "#002b36", fg = "#839496" })
