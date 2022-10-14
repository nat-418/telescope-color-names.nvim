local pickers       = require('telescope.pickers')
local finders       = require('telescope.finders')
local conf          = require('telescope.config').values
local actions       = require('telescope.actions')
local actions_state = require('telescope.actions.state')

-- -- X11 / web color names
local color_names_list = {
  'White', 'Snow', 'Ivory', 'Linen', 'AntiqueWhite', 'Beige', 'WhiteSmoke',
  'LavenderBlush', 'OldLace', 'AliceBlue', 'SeaShell', 'GhostWhite',
  'Honeydew', 'FloralWhite', 'Azure', 'MintCream', 'Black', 'DarkSlateGray',
  'DimGray', 'SlateGray', 'Gray', 'LightSlateGray', 'Silver', 'LightGray',
  'Gainsboro', 'Pink', 'LightPink', 'HotPink', 'PaleVioletRed', 'DeepPink',
  'MediumVioletRed', 'Indigo', 'Purple', 'DarkMagenta', 'DarkViolet',
  'DarkSlateBlue', 'BlueViolet', 'DarkOrchid', 'Fuchsia', 'Magenta',
  'SlateBlue', 'MediumSlateBlue', 'MediumOrchid', 'MediumPurple', 'Orchid',
  'Violet', 'Plum', 'Thistle', 'Lavender', 'DarkRed', 'Red', 'Firebrick',
  'Crimson', 'IndianRed', 'LightCoral', 'Salmon', 'DarkSalmon', 'LightSalmon',
  'OrangeRed', 'Tomato', 'DarkOrange', 'Coral', 'Orange', 'DarkKhaki', 'Gold',
  'Khaki', 'PeachPuff', 'Yellow', 'PaleGoldenRod', 'Moccasin', 'PapayaWhip',
  'LightGoldenRodYellow', 'LemonChiffon', 'LightYellow', 'MidnightBlue',
  'Navy', 'DarkBlue', 'MediumBlue', 'Blue', 'RoyalBlue', 'SteelBlue',
  'DodgerBlue', 'DeepSkyBlue', 'CornFlowerBlue', 'SkyBlue', 'LightSkyBlue',
  'LightSteelBlue', 'LightBlue', 'PowderBlue', 'Maroon', 'Brown',
  'SaddleBrown', 'Sienna', 'Chocolate', 'DarkGoldenRod', 'Peru', 'RosyBrown',
  'GoldenRod', 'SandyBrown', 'Tan', 'BurlyWood', 'Wheat', 'NavajoWhite',
  'Bisque', 'BlanchedAlmond', 'Cornsilk', 'Teal', 'DarkCyan', 'LightSeaGreen',
  'CadetBlue', 'DarkTurquoise', 'MediumTurquoise', 'Turquoise', 'Aqua',
  'Cyan', 'Aquamarine', 'PaleTurquoise', 'LightCyan', 'DarkGreen', 'Green',
  'DarkOliveGreen', 'ForestGreen', 'SeaGreen', 'Olive', 'OliveDrab',
  'MediumSeaGreen', 'LimeGreen', 'Lime', 'SpringGreen', 'MediumSpringGreen',
  'DarkSeaGreen', 'MediumAquamarine', 'YellowGreen', 'LawnGreen',
  'Chartreuse', 'LightGreen', 'GreenYellow', 'PaleGreen',
}

local attach_mappings = function(prompt_bufnr, _)
  actions.select_default:replace(function()
    actions.close(prompt_bufnr)
    local selection = actions_state.get_selected_entry()
    vim.api.nvim_put({ selection[1] }, '', false, true)
  end)

  return true
end

local run = function(opts)
  opts = opts or {}

  local picker = pickers.new(opts, {
    prompt_title = "Color Names",
    finder = finders.new_table({ results = color_names_list }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = attach_mappings
  })

  return picker:find()
end

return require('telescope').register_extension({
  exports = {
    color_names = run
  }
})

