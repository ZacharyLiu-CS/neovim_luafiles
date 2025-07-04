local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	vim.notify("Fail to load plugin: which-key!", "error")
	return
end

which_key.setup( {
  opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
  }
})
which_key.add( {
		{ "<leader>L", group = "Lazy", nowait = true, remap = false },
		{
			"<leader>LC",
			"<cmd>Lazy health<cr>",
			desc = "Check",
			nowait = true,
			remap = false,
		},
		{
			"<leader>Lc",
			"<cmd>Lazy clean<cr>",
			desc = "Clean",
			nowait = true,
			remap = false,
		},
		{
			"<leader>Lh",
			"<cmd>Lazy home<cr>",
			desc = "Home",
			nowait = true,
			remap = false,
		},
		{
			"<leader>Li",
			"<cmd>Lazy install<cr>",
			desc = "Install",
			nowait = true,
			remap = false,
		},
		{
			"<leader>Lp",
			"<cmd>Lazy profile<cr>",
			desc = "Profile",
			nowait = true,
			remap = false,
		},
		{
			"<leader>Ls",
			"<cmd>Lazy sync<cr>",
			desc = "Sync",
			nowait = true,
			remap = false,
		},
		{
			"<leader>Lu",
			"<cmd>Lazy update<cr>",
			desc = "Update",
			nowait = true,
			remap = false,
		},
		{
			"<leader>b",
			"<cmd>lua require 'telescope.builtin'.buffers()<CR>",
			desc = "Switch Buffers",
			nowait = true,
			remap = false,
		},
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<cr>",
			desc = "Explorer",
			nowait = true,
			remap = false,
		},
		{ "<leader>f", group = "fuzzy find", nowait = true, remap = false },
		{
			"<leader>fB",
			"<cmd>Telescope git_branches<cr>",
			desc = "Checkout branch",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fC",
			"<cmd>Telescope colorscheme<cr>",
			desc = "Colorscheme",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fM",
			"<cmd>Telescope man_pages<cr>",
			desc = "Man Pages",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fR",
			"<cmd>Telescope registers<cr>",
			desc = "Registers",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fb",
			"<cmd>lua require 'telescope.builtin'.buffers()<CR>",
			desc = "Switch Buffers",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fc",
			"<cmd>Telescope commands<cr>",
			desc = "Commands",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Find files",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
			desc = "Grep files",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fh",
			"<cmd>Telescope help_tags<cr>",
			desc = "Find Help",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fm",
			"<cmd>Telescope keymaps<cr>",
			desc = "Keymaps",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fp",
			"<cmd>Telescope projects<cr>",
			desc = "Toggle projects",
			nowait = true,
			remap = false,
		},
		{
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Open Recent File",
			nowait = true,
			remap = false,
		},
		{ "<leader>g", group = "Git", nowait = true, remap = false },
		{
			"<leader>gR",
			"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
			desc = "Reset Buffer",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gb",
			"<cmd>Telescope git_branches<cr>",
			desc = "Checkout branch",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			desc = "Checkout commit",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gg",
			"<cmd>lua _LAZYGIT_TOGGLE()<CR>",
			desc = "Lazygit",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gj",
			"<cmd>lua require 'gitsigns'.next_hunk()<cr>",
			desc = "Next Hunk",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gk",
			"<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
			desc = "Prev Hunk",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gl",
			"<cmd>lua require 'gitsigns'.blame_line()<cr>",
			desc = "Blame",
			nowait = true,
			remap = false,
		},
		{
			"<leader>go",
			"<cmd>Telescope git_status<cr>",
			desc = "Open changed file",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gp",
			"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
			desc = "Preview Hunk",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gr",
			"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
			desc = "Reset Hunk",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gs",
			"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
			desc = "Stage Hunk",
			nowait = true,
			remap = false,
		},
		{
			"<leader>gu",
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			desc = "Undo Stage Hunk",
			nowait = true,
			remap = false,
		},
		{
			"<leader>h",
			"<cmd>nohlsearch<CR>",
			desc = "No Highlight",
			nowait = true,
			remap = false,
		},
		{ "<leader>l", group = "LSP", nowait = true, remap = false },
		{
			"<leader>lI",
			"<cmd>LspInstallInfo<cr>",
			desc = "Installer Info",
			nowait = true,
			remap = false,
		},
		{
			"<leader>lS",
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			desc = "Workspace Symbols",
			nowait = true,
			remap = false,
		},
		{
			"<leader>la",
			"<cmd>lua vim.lsp.buf.code_action()<cr>",
			desc = "Code Action",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ld",
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			desc = "Document Diagnostics",
			nowait = true,
			remap = false,
		},
		{
			"<leader>lf",
			"<cmd>lua vim.lsp.buf.format{async=true}<cr>",
			desc = "Format",
			nowait = true,
			remap = false,
		},
		{
			"<leader>li",
			"<cmd>LspInfo<cr>",
			desc = "Info",
			nowait = true,
			remap = false,
		},
		{
			"<leader>lj",
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			desc = "Next Diagnostic",
			nowait = true,
			remap = false,
		},
		{
			"<leader>lk",
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			desc = "Prev Diagnostic",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ll",
			"<cmd>lua vim.lsp.codelens.run()<cr>",
			desc = "CodeLens Action",
			nowait = true,
			remap = false,
		},
		{
			"<leader>lq",
			"<cmd>lua vim.diagnostic.setloclist()<cr>",
			desc = "Quickfix",
			nowait = true,
			remap = false,
		},
		{
			"<leader>lr",
			"<cmd>lua vim.lsp.buf.rename()<cr>",
			desc = "Rename",
			nowait = true,
			remap = false,
		},
		{
			"<leader>ls",
			"<cmd>Telescope lsp_document_symbols<cr>",
			desc = "Document Symbols",
			nowait = true,
			remap = false,
		},
		{
			"<leader>lw",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Workspace Diagnostics",
			nowait = true,
			remap = false,
		},
		{ "<leader>s", group = "Split window", nowait = true, remap = false },
		{
			"<leader>sh",
			"<cmd>split<CR>",
			desc = "Horizontal",
			nowait = true,
			remap = false,
		},
		{
			"<leader>sv",
			"<cmd>vsplit<CR>",
			desc = "Vertical",
			nowait = true,
			remap = false,
		},
		{ "<leader>t", group = "Terminal", nowait = true, remap = false },
		{
			"<leader>tf",
			"<cmd>ToggleTerm direction=float<cr>",
			desc = "Float",
			nowait = true,
			remap = false,
		},
		{
			"<leader>tg",
			"<cmd>lua _LAZYGIT_TOGGLE()<cr>",
			desc = "Git",
			nowait = true,
			remap = false,
		},
		{
			"<leader>th",
			"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
			desc = "Horizontal",
			nowait = true,
			remap = false,
		},
		{
			"<leader>tn",
			"<cmd>lua _NODE_TOGGLE()<cr>",
			desc = "Node",
			nowait = true,
			remap = false,
		},
		{
			"<leader>tp",
			"<cmd>lua _PYTHON_TOGGLE()<cr>",
			desc = "Python",
			nowait = true,
			remap = false,
		},
		{
			"<leader>tt",
			"<cmd>lua _HTOP_TOGGLE()<cr>",
			desc = "Htop",
			nowait = true,
			remap = false,
		},
		{
			"<leader>tu",
			"<cmd>lua _NCDU_TOGGLE()<cr>",
			desc = "NCDU",
			nowait = true,
			remap = false,
		},
		{
			"<leader>tv",
			"<cmd>ToggleTerm size=80 direction=vertical<cr>",
			desc = "Vertical",
			nowait = true,
			remap = false,
		},
		{
			"<leader>w",
			"<cmd>Bdelete!<CR>",
			desc = "Close Buffer",
			nowait = true,
			remap = false,
		},
		{ "<leader>z", group = "ZenMode", nowait = true, remap = false },
		{
			"<leader>zc",
			"<cmd>close<cr>",
			desc = "Leave zen mode",
			nowait = true,
			remap = false,
		},
		{
			"<leader>zz",
			"<cmd>ZenMode<cr>",
			desc = "Enter zen mode",
			nowait = true,
			remap = false,
		},
	})
