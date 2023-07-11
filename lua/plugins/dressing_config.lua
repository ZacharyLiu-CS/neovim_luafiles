local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
  vim.notify("Fail to load plugin: dressing!", "error")
  return
end
dressing.setup({
  select = {
    get_config = function(opts)
      if opts.kind == 'codeaction' then
        return {
          backend = 'nui',
          nui = {
            relative = 'cursor',
            max_width = 40,
          }
        }
      end
    end
  }
})
