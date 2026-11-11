local M = {}

-- Neovim 0.11+ 推荐用 vim.lsp.config / vim.lsp.enable 配置 LSP，
-- 不再使用已被移除的 vim.lsp.with() 和 vim.lsp.handlers。
M.capabilities = {}

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_status_ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities()
else
	vim.notify("Fail to load plugin: cmp_nvim_lsp!", "error")
end

local keymap_opts = { noremap = true, silent = true }

local function lsp_keymaps(bufnr)
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keymap_opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keymap_opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({ border = 'rounded' })<CR>", keymap_opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", keymap_opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", keymap_opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", keymap_opts)
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", keymap_opts)
	-- nvim-lspconfig 2.x 不再注册 :LspInfo，改用内置的 :checkhealth vim.lsp
	keymap(bufnr, "n", "<leader>li", "<cmd>checkhealth vim.lsp<cr>", keymap_opts)
	-- :LspInstallInfo 也已移除，安装 LSP 用 :Mason
	keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", keymap_opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", keymap_opts)
	-- vim.lsp.diagnostic.goto_next/prev 在新版本中已不存在
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({ buffer = 0 })<cr>", keymap_opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({ buffer = 0 })<cr>", keymap_opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", keymap_opts)
	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help({ border = 'rounded' })<CR>", keymap_opts)
	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", keymap_opts)
end

-- 保持向后兼容：外部如果还引用 M.on_attach 也仍然可用
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

	-- 全局能力配置，会在每个 server 启动时合并进去
	vim.lsp.config("*", {
		capabilities = M.capabilities,
	})

	-- 用 LspAttach 挂 buffer 级键位，避免覆盖 server 自带的 on_attach
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
		callback = function(args)
			lsp_keymaps(args.buf)
		end,
	})

	-- 保存时自动格式化（含 :w、:wa 以及 autowrite 触发的写入）。
	-- 只对确实有格式化能力的 LSP 客户端生效，例如 C/C++ 的 clangd。
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("UserLspFormatOnSave", { clear = true }),
		callback = function(args)
			local bufnr = args.buf
			local clients = vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/formatting" })
			if #clients == 0 then
				return
			end
			-- 同时挂了多个格式化客户端时只用一个，避免同一文件被格式化多次
			vim.lsp.buf.format({
				bufnr = bufnr,
				id = clients[1].id,
				async = false,
				timeout_ms = 2000,
			})
		end,
	})
end

return M
