return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          -- Configuration pour Tailwind CSS LSP
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  "tw`([^`]*)", -- tw`...`
                  'tw="([^"]*)', -- <div tw="..." />
                  'tw={"([^"}]*)', -- <div tw={"..."} />
                  "tw\\.\\w+`([^`]*)", -- tw.div`...`
                  { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "classnames\\(([^)]*)\\)", "'([^']*)'" },
                  { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" }, -- pour shadcn/ui
                },
              },
            },
          },
        },
      },
    },
  },
}
