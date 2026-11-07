-- 只在"写文章"的 buffer 里开拼写检查，代码 buffer 保持 nospell。
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserSpell", { clear = true }),
  pattern = { "markdown", "gitcommit", "text", "tex", "rst" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
    -- 想让中文注释也不标红：先执行一次 `:set spelllang=cjk` 下载 cjk 词库，
    -- 再把上面一行改成 { "en_us", "cjk" }。
  end,
})

-- C/C++ 保存时自动格式化（clangd / none-ls 的 clang-format），
-- 手写时缩进偶尔歪了也会在 :w 时自动修好。
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("UserFormatOnSave", { clear = true }),
  pattern = { "*.c", "*.cc", "*.cpp", "*.cxx", "*.h", "*.hh", "*.hpp" },
  callback = function(args)
    pcall(vim.lsp.buf.format, { bufnr = args.buf, async = false })
  end,
})
