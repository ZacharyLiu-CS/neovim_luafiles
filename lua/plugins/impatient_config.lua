local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  vim.notify("Fail to load plugin: impatient!", "error")
  return
end

impatient.enable_profile()
