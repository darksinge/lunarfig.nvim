require("autocmds")

local M = {}

local get_config_dir = function()
  local lvim_config_dir = os.getenv "LUNARVIM_CONFIG_DIR"
  if not lvim_config_dir then
    return vim.fn.stdpath "config"
  end
  return lvim_config_dir
end

local get_config_file = function()
  return get_config_dir() .. "/config.json"
end

-- local P = function(v)
--   print(vim.inspect(v))
--   return v
-- end

local marshall_config = function(input_config)
  local config = input_config or {}

  if config.fontFamily and config.fontSize then
    local font = config.fontFamily .. ':h' .. config.fontSize
    config.fontFamily = font
  elseif config.fontSize and vim.opt.guifont then
    local font = vim.opt.guifont .. ':h' .. config.fontSize
    config.fontFamily = font
  end

  return config
end

local load_config = function()
  local config_file_path = get_config_file()
  local f = assert(io.open(config_file_path, "rb"))
  local content = f:read("*all")
  f:close()
  local decoded = vim.json.decode(content)
  return marshall_config(decoded)
end

local lvim_mappings = {
  colorscheme = "colorscheme",
  formatOnSave = "format_on_save",
}

local vim_opt_mappings = {
  shell = "shell",
  fontFamily = "guifont",
}

local map_config = function(config)
  for source, target in pairs(lvim_mappings) do
    if config[source] then
      lvim[target] = config[source]
    end
  end

  for source, target in pairs(vim_opt_mappings) do
    if config[source] then
      vim.opt[target] = config[source]
    end
  end
end

M.setup = function()
  local config = load_config()
  map_config(config)
end

return M
