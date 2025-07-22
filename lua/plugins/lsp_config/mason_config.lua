local servers = {
	"lua_ls",
  "rust_analyzer",
  "clangd",
  "zls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("Fail to load plugin: lspconfig!", "error")
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("plugins.lsp_config.setup").on_attach,
		capabilities = require("plugins.lsp_config.setup").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "plugins.lsp_config.servers" .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
