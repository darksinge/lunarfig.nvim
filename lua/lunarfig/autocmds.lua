vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json" },
  callback = function()
    local path = vim.fn.expand("%:p")

    vim.schedule(function()
      local is_lvim_config = path:match "%.lunarvim/config%.json$"
      if is_lvim_config then
        print("it's a match!!!!!!!")
      end
    end)
  end
})
