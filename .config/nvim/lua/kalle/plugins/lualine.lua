local status, lualine = pcall(require, "lualine")
if not status then 
  return
end

local lualine_theme = require("lualine.themes.molokai")

local new_colors = {
  yellow = "#e5b567",
  green = "#b4d273",
  pink = "#b05279",
  blue = "#6c99bb",
  black = "#000000",
}

-- lualine_theme.normal = {
--   a = {
--     gui = "bold",
--     bg = new_colors.blue,
--     fg = new_colors.black,
--   },
-- }
-- lualine_theme.insert = {
--   a = {
--     gui = "bold",
--     bg = new_colors.pink,
--     fg = new_colors.black,
--   },
-- }
-- lualine_theme.visual = {
--   a = {
--     gui = "bold",
--     bg = new_colors.yellow,
--     fg = new_colors.black,
--   },
-- }
-- lualine_theme.command = {
--   a = {
--     gui = "bold",
--     bg = new_colors.green,
--     fg = new_colors.black,
--   },
-- }

lualine.setup({
  options = {
    theme = lualine_theme,
  },
})
