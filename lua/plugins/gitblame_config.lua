local status_ok, gitblame = pcall(require, "gitblame")
if not status_ok then
  vim.notify("Fail to load plugin: gitblam ", "error")
  return
end
gitblame.setup({
  enabled = true, -- if you want to enable the plugin
  message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
  date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
  virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
})
