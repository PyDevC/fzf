require("pydevc.set")
require("pydevc.remap")
require("pydevc.lazy")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "silent! lcd %:p:h"
})
