-- NORD
-- local highlights = require("nord").bufferline.highlights({
--     italic = true,
--     bold = true,
-- })
-- rose pine
-- local highlights = require('rose-pine.plugins.bufferline')
-- local highlights = require('rose-pine.plugins.bufferline')
-- highlights = require("nord.plugins.bufferline").akinsho(),
require("bufferline").setup({
  options = {
    separator_style = "thin",
    always_show_bufferline = true,
    show_tab_indicators = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end
  }
})
