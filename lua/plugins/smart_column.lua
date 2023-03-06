local status_ok, smart_column = pcall(require, "smartcolumn")
if not status_ok then
  vim.notify("Fail to load plugin: smart column!", "error")
  return
end
smart_column.setup()


