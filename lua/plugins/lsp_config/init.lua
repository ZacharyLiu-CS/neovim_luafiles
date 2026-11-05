-- Register global capabilities and LspAttach keymaps before servers are enabled.
require("plugins.lsp_config.setup").setup()
require("plugins.lsp_config.mason_config")
require("plugins.lsp_config.null_ls_config")
