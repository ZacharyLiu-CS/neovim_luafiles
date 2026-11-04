local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("Fail to load plugin: null-ls!", "error")
  return
end

-- 只注册本机确实存在的可执行文件，避免每次启动/格式化时刷
-- "command xxx is not executable" 的错误。装好对应工具后重启 nvim 即会自动启用。
local function executable(cmd)
  return vim.fn.executable(cmd) == 1
end

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.code_actions.gitsigns,
}

if executable("prettier") then
  table.insert(sources, null_ls.builtins.formatting.prettier)
end
if executable("clang-format") then
  table.insert(sources, null_ls.builtins.formatting.clang_format)
end
if executable("stylua") then
  table.insert(sources, null_ls.builtins.formatting.stylua)
end
if executable("write-good") then
  table.insert(sources, null_ls.builtins.diagnostics.write_good)
end

null_ls.setup({ sources = sources })


vim.api.nvim_set_keymap('n', '<A-f>', ":lua vim.lsp.buf.format{ async = true }<CR>", {})
vim.api.nvim_set_keymap('n', 'gl', ":lua vim.diagnostic.open_float()<CR>", {})
vim.api.nvim_set_keymap('n', '<A-d>', ":lua vim.diagnostic.setqflist()<CR>", {})
