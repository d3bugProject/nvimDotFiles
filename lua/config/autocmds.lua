--[[
  🧩✨ Smart nvim-cmp management during LuaSnip snippet editing ✨🧩

  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  👇 What does this block do?
    - When you're using a snippet (with LuaSnip), the completion popup (nvim-cmp)
      can sometimes get in the way by staying open on snippet placeholders.
    - This code disables nvim-cmp's completion automatically
      while you're editing a snippet, and re-enables it as soon as you leave.
    - 👉 Result: You can move through snippet placeholders WITHOUT any annoying completion popups!

  ⚙️ How it works:
    1️⃣ When you enter a snippet field (placeholder):
        ➔ cmp is disabled for the current buffer.
    2️⃣ When you leave a snippet field:
        ➔ cmp is re-enabled for the current buffer.
    3️⃣ As a safety net, if you leave insert mode (InsertLeave):
        ➔ cmp is re-enabled.

  🔥 Tip:
    - You can adapt this pattern for other snippet engines or completion plugins if needed!

  🚦 Copy & paste this block for a super smooth "snippets first" experience!
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
]]

local ok_cmp, cmp = pcall(require, "cmp")
local ok_luasnip, luasnip = pcall(require, "luasnip")

if ok_cmp and ok_luasnip then
  -- Désactive cmp dès qu'on entre dans un placeholder de snippet
  vim.api.nvim_create_autocmd("User", {
    pattern = "LuasnipInsertNodeEnter",
    callback = function()
      cmp.setup.buffer({ enabled = false })
    end,
  })

  -- Réactive cmp dès qu'on quitte un placeholder de snippet
  vim.api.nvim_create_autocmd("User", {
    pattern = "LuasnipInsertNodeLeave",
    callback = function()
      cmp.setup.buffer({ enabled = true })
    end,
  })

  -- Sûreté : si tu quittes le mode insert, réactive cmp
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      cmp.setup.buffer({ enabled = true })
    end,
  })
end
