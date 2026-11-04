-- 先注册全局能力与 LspAttach（setup），再读取 server 配置并启用它们。
require("plugins.lsp_config.setup").setup()
require("plugins.lsp_config.mason_config")
require("plugins.lsp_config.null_ls_config")
