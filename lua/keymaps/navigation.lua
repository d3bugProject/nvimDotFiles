local key = vim.keymap.set
local opt = { noremap = true, silent = true }

-----------------------------------------------------------------
-- navigation
------------------------------------------------------------------
vim.keymap.set("n", "l", function()
  local line = vim.fn.input("Aller à la ligne : ")
  line = tonumber(line)
  if line then
    vim.cmd(tostring(line))
  end
end, { desc = "Aller à un numéro de ligne" })
