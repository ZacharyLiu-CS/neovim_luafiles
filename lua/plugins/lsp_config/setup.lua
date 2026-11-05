local M = {}

-- Neovim 0.11+ configures clients through vim.lsp.config / vim.lsp.enable.
-- The old vim.lsp.with() and vim.lsp.handlers customization used below has
-- been removed from Neovim 0.12.
M.capabilities = {}

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_status_ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities()
	-- Keep clangd's preferred offset encoding (avoids its UTF-8 warning).
	M.capabilities.offsetEncoding = { "utf-16" }
else
	vim.notify("Fail to load plugin: cmp_nvim_lsp!", "error")
end

local function lsp_keymaps(bufnr)
	local function map(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, { buf = bufnr, silent = true, desc = desc })
	end

	map("gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
	map("gd", vim.lsp.buf.definition, "LSP: Go to definition")
	map("K", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end, "LSP: Hover documentation")
	map("gI", vim.lsp.buf.implementation, "LSP: Go to implementation")
	map("gr", vim.lsp.buf.references, "LSP: Go to references")
	map("gl", vim.diagnostic.open_float, "LSP: Open diagnostic float")
	map("<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, "LSP: Format buffer")
	-- nvim-lspconfig no longer registers :LspInfo; use the built-in healthcheck.
	map("<leader>li", "<cmd>checkhealth vim.lsp<cr>", "LSP: Info")
	-- :LspInstallInfo was removed with nvim-lsp-installer; Mason replaces it.
	map("<leader>lI", "<cmd>Mason<cr>", "LSP: Installer")
	map("<leader>la", vim.lsp.buf.code_action, "LSP: Code action")
	map("<leader>lj", function()
		vim.diagnostic.jump({ count = 1 })
	end, "LSP: Next diagnostic")
	map("<leader>lk", function()
		vim.diagnostic.jump({ count = -1 })
	end, "LSP: Previous diagnostic")
	map("<leader>lr", vim.lsp.buf.rename, "LSP: Rename")
	map("<leader>ls", function()
		vim.lsp.buf.signature_help({ border = "rounded" })
	end, "LSP: Signature help")
	map("<leader>lq", vim.diagnostic.setloclist, "LSP: Quickfix")
end

-- Kept for compatibility with configs that still reference M.on_attach.
M.on_attach = lsp_keymaps

function M.setup()
	vim.diagnostic.config({
		virtual_text = false, -- disable virtual text
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "󰋼",
				[vim.diagnostic.severity.HINT] = "󰌵",
			},
			texthl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticError",
				[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
				[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
				[vim.diagnostic.severity.HINT] = "DiagnosticHint",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "",
			},
		},

		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	-- Global client capabilities, merged into every server config below.
	vim.lsp.config("*", {
		capabilities = M.capabilities,
	})

	-- Attach buffer-local keymaps when a server starts. This avoids
	-- overwriting a server's own on_attach callback.
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
		callback = function(args)
			lsp_keymaps(args.buf)
		end,
	})
end

return M
