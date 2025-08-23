local key = vim.keymap.set
local opt = { noremap = true, silent = true }

-- ======================================================
-- Reload config
-- -- ======================================================

-- Keymap manuel pour recharger la config (optionnel)
key("n", "<leader>r", function()
  local current_file = vim.fn.expand("%:p")

  -- Vérifie si le fichier existe et est un fichier lua
  if current_file == "" then
    vim.notify("Aucun fichier à recharger", vim.log.levels.WARN)
    return
  end

  if not current_file:match("%.lua$") then
    vim.notify("Ce n'est pas un fichier Lua", vim.log.levels.WARN)
    return
  end

  -- Sauvegarde d'abord si le fichier est modifié
  if vim.bo.modified then
    vim.cmd("write")
  end

  -- Recharge le fichier
  local ok, err = pcall(vim.cmd, "source " .. current_file)
  if ok then
    vim.notify("Config rechargée ! ⚡", vim.log.levels.INFO)
  else
    vim.notify("Erreur lors du rechargement: " .. err, vim.log.levels.ERROR)
  end
end, { desc = "Reload current lua file" })

-- Keymap pour recharger complètement Neovim (plus radical)
key("n", "<leader>R", function()
  local config_path = vim.fn.stdpath("config") .. "/init.lua"
  local ok, err = pcall(vim.cmd, "source " .. config_path)
  if ok then
    vim.notify("Configuration complète rechargée ! 🚀", vim.log.levels.INFO)
  else
    vim.notify("Erreur: " .. err, vim.log.levels.ERROR)
  end
end, { desc = "Reload full config" })
