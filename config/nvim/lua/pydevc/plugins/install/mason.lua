return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ensure_install = {
        "bashls",
        "pyright",
        "pylsp",
        "lua_ls",
        "clangd",
        "yamlls",
        "jsonls",
        "vimls",
      }
    })

    require("mason-lspconfig").setup({
      automatic_installation = true,
    })

    require("mason-tool-installer").setup({ensure_installed = ensure_installed})
  end,
}
