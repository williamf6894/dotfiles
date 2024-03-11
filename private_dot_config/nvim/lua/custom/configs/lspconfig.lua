local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern "Cargo.toml",
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

if not config.helm_ls then
  config.helm_ls = {
    default_config = {
      cmd = { "helm_ls", "serve" },
      filetypes = { "helm" },
      root_dir = function(fname)
        return lspconfig.util.root_pattern "Chart.yaml"(fname)
      end,
    },
  }
end
lspconfig.helm_ls.setup {
  filetypes = { "helm" },
  cmd = { "helm_ls", "serve" },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

-- lspconfig.yamlls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "yaml" },
--   settings = {
--     yaml = {
--       schemaStore = {
--         enable = true,
--       },
--       schemas = require("schemastore").yaml.schemas(),
--     },
--   },
-- }
