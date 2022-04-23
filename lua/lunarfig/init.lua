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

local default_configs = {
  font_family = "monospace:h15",
  font_size = 15,
}

local marshall_config = function(input_config)
  local config = input_config or {}

  -- Figure out string to use for `vim.guifont`
  --
  -- NOTE: the computed value for `vim.guifont` is stored in `config.font`, not
  -- `config.fontFamily`
  local fontFamily = config.fontFamily or vim.opt.guifont or default_configs.font_family
  local fontSize = config.fontSize or default_configs.font_size
  if fontFamily:match("%.*:h%d%+%$") then
    config.font = fontFamily
  else
    local font = fontFamily .. ':h' .. fontSize
    config.font = font
  end

  -- if config.fontFamily and config.fontSize then
  --   local font = config.fontFamily .. ':h' .. config.fontSize
  --   config.fontFamily = font
  -- elseif config.fontSize and vim.opt.guifont then
  --   local font = vim.opt.guifont .. ':h' .. config.fontSize
  --   config.fontFamily = font
  -- end

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

local load_lunarfig = function()
  local config = load_config()
  map_config(config)
  return config
end

M.setup = function()
  local initial_config = load_lunarfig()

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "config.json" },
    callback = function()
      local fpath = vim.fn.expand("%:p")
      local is_lvim_config = fpath:match "%.config/lvim/config%.json$"

      -- TODO: Compare `config` with `initial_config` and only reload
      -- values that have changed.
      if is_lvim_config then
        vim.schedule(function()

          -- Re-read the lunarfig config.json file
          local config = load_lunarfig()


          -- font
          vim.cmd("set guifont=" .. config.font:gsub(" ", "\\ "))

          -- colorscheme
          if config.colorscheme then
            vim.cmd("colorscheme " .. config.colorscheme)
          end

          -- -- format on save
          -- if config.format_on_save then
          --   -- TODO: Figure out how to toggle this...
          -- end
        end)
      end
    end
  })
end

return M
