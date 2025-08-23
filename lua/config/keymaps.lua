-- Charge automatiquement tous les fichiers *.lua (sauf init.lua) du dossier keymaps

local keymaps_dir = vim.fn.stdpath("config") .. "/lua/keymaps"
local scan = vim.loop.fs_scandir or vim.loop.fs_scandir_sync -- compatibilité selon version

local function load_keymap_files()
  local handle, err = scan(keymaps_dir)
  if not handle then
    vim.notify("Impossible d'ouvrir le dossier keymaps: " .. (err or ""), vim.log.levels.ERROR)
    return
  end

  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end
    if name ~= "init.lua" and name:sub(-4) == ".lua" then
      local module_name = "keymaps." .. name:gsub("%.lua$", "")
      pcall(require, module_name)
    end
  end
end

load_keymap_files()
