return {
  { "saghen/blink.nvim", enabled = false },
  { "saghen/blink.cmp", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      -- Optionnel : d'autres sources utiles
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip", -- si vous utilisez luasnip
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.preselect = cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noselect",
        -- Optionnel : délai avant déclenchement
        keyword_length = 1,
      }

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 }, -- si snippets
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      })

      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = true }),
        }),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
      })

      -- Optionnel : apparence
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      return opts
    end,
  },
}
