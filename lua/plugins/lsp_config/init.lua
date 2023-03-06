local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Fail to load plugin: lspconfig!", "error")
  return
end

require "plugins.lsp_config.mason_config"
require("plugins.lsp_config.setup").setup()
require("plugins.lsp_config.null_ls_config")
