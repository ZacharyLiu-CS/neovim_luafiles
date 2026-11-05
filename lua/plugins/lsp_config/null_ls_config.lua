local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("Fail to load plugin: null-ls!", "error")
  return
end

local function executable(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Register only the executables that actually exist, so missing optional tools
-- do not produce "command is not executable" errors on every format attempt.
local sources = {
  null_ls.builtins.code_actions.gitsigns,
}

if executable("prettier") then
  table.insert(sources, null_ls.builtins.formatting.prettier)
end
if executable("clang-format") then
  table.insert(sources, null_ls.builtins.formatting.clang_format.with({
    extra_args = { "--style=file" }, -- or a specific style like "--style=Google"
  }))
end
if executable("stylua") then
  table.insert(sources, null_ls.builtins.formatting.stylua)
end
if executable("write-good") then
  table.insert(sources, null_ls.builtins.diagnostics.write_good)
end

null_ls.setup({ sources = sources })

vim.keymap.set("n", "<A-f>", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "LSP: Format buffer" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "LSP: Open diagnostic float" })
vim.keymap.set("n", "<A-d>", vim.diagnostic.setqflist, { desc = "LSP: Diagnostics quickfix" })
