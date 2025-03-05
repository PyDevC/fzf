return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      { "j-hui/fidget.nvim", opts = {} },

      -- Schema information
      "b0o/SchemaStore.nvim",
    },
    config = function()
      require("neodev").setup {
      }

      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local lspconfig = require "lspconfig"

      local servers = {
        bashls = true,
        lua_ls = true,
        pyright = true,

        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },

        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        },

        clangd = {
          -- TODO: Could include cmd, but not sure those were all relevant flags.
          --    looks like something i would have added while i was floundering
          init_options = { clangdFileStatus = true },
          filetypes = { "c" },
        },
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      local disable_semantic_tokens = {
        lua = true,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

					vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = 0})
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
					vim.keymap.set("n", "go", vim.lsp.buf.type_definition, {buffer = 0})
					vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = 0})
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, {buffer = 0})
					vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {buffer = 0})
					vim.keymap.set({ "n", "x" }, "<leader>bf", vim.lsp.buf.format, {buffer = 0})
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})
		end,
  },
}
