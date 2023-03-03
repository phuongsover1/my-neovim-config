-- local line_ok, feline = pcall(require, "feline")
-- if not line_ok then return end
--
-- local one_monokai = {
--   fg = "#abb2bf",
--   bg = "#1e2024",
--   green = "#98c379",
--   yellow = "#e5c07b",
--   purple = "#c678dd",
--   orange = "#d19a66",
--   peanut = "#f6d5a4",
--   red = "#e06c75",
--   aqua = "#61afef",
--   darkblue = "#282c34",
--   dark_red = "#f75f5f"
-- }
--
-- local vi_mode_colors = {
--   NORMAL = "green",
--   OP = "green",
--   INSERT = "yellow",
--   VISUAL = "purple",
--   LINES = "orange",
--   BLOCK = "dark_red",
--   REPLACE = "red",
--   COMMAND = "aqua"
-- }
--
-- local c = {
--   vim_mode = {
--     provider = {
--       name = "vi_mode",
--       opts = {
--         show_mode_name = true
--         -- padding = "center", -- Uncomment for extra padding.
--       }
--     },
--     hl = function()
--       return {
--         fg = require("feline.providers.vi_mode").get_mode_color(),
--         bg = "darkblue",
--         style = "bold",
--         name = "NeovimModeHLColor"
--       }
--     end,
--     left_sep = "block",
--     right_sep = "block"
--   },
--   gitBranch = {
--     provider = "git_branch",
--     hl = {fg = "peanut", bg = "darkblue", style = "bold"},
--     left_sep = "block",
--     right_sep = "block"
--   },
--   gitDiffAdded = {
--     provider = "git_diff_added",
--     hl = {fg = "green", bg = "darkblue"},
--     left_sep = "block",
--     right_sep = "block"
--   },
--   gitDiffRemoved = {
--     provider = "git_diff_removed",
--     hl = {fg = "red", bg = "darkblue"},
--     left_sep = "block",
--     right_sep = "block"
--   },
--   gitDiffChanged = {
--     provider = "git_diff_changed",
--     hl = {fg = "fg", bg = "darkblue"},
--     left_sep = "block",
--     right_sep = "right_filled"
--   },
--   separator = {provider = ""},
--   fileinfo = {
--     provider = {name = "file_info", opts = {type = "relative-short"}},
--     hl = {style = "bold"},
--     left_sep = " ",
--     right_sep = " "
--   },
--   diagnostic_errors = {provider = "diagnostic_errors", hl = {fg = "red"}},
--   diagnostic_warnings = {provider = "diagnostic_warnings", hl = {fg = "yellow"}},
--   diagnostic_hints = {provider = "diagnostic_hints", hl = {fg = "aqua"}},
--   diagnostic_info = {provider = "diagnostic_info"},
--   lsp_client_names = {
--     provider = "lsp_client_names",
--     hl = {fg = "purple", bg = "darkblue", style = "bold"},
--     left_sep = "left_filled",
--     right_sep = "block"
--   },
--   file_type = {
--     provider = {name = "file_type", opts = {filetype_icon = true, case = "titlecase"}},
--     hl = {fg = "red", bg = "darkblue", style = "bold"},
--     left_sep = "block",
--     right_sep = "block"
--   },
--   file_encoding = {
--     provider = "file_encoding",
--     hl = {fg = "orange", bg = "darkblue", style = "italic"},
--     left_sep = "block",
--     right_sep = "block"
--   },
--   position = {
--     provider = "position",
--     hl = {fg = "green", bg = "darkblue", style = "bold"},
--     left_sep = "block",
--     right_sep = "block"
--   },
--   line_percentage = {
--     provider = "line_percentage",
--     hl = {fg = "aqua", bg = "darkblue", style = "bold"},
--     left_sep = "block",
--     right_sep = "block"
--   },
--   scroll_bar = {provider = "scroll_bar", hl = {fg = "yellow", style = "bold"}}
-- }
--
-- local left = {
--   c.vim_mode, c.gitBranch, c.gitDiffAdded, c.gitDiffRemoved, c.gitDiffChanged, c.separator
-- }
--
-- local middle = {
--   c.fileinfo, c.diagnostic_errors, c.diagnostic_warnings, c.diagnostic_info, c.diagnostic_hints
-- }
--
-- local right = {
--   c.lsp_client_names, c.file_type, c.file_encoding, c.position, c.line_percentage, c.scroll_bar
-- }
--
-- local components = {active = {left, middle, right}, inactive = {left, middle, right}}
--
-- feline.setup({components = components, theme = one_monokai, vi_mode_colors = vi_mode_colors})
--
--
--
local present, feline = pcall(require, "feline")

if not present then return end

local theme = {
  aqua = "#7AB0DF",
  bg = "#1C212A",
  blue = "#5FB0FC",
  cyan = "#70C0BA",
  darkred = "#FB7373",
  fg = "#C7C7CA",
  gray = "#222730",
  green = "#79DCAA",
  lime = "#54CED6",
  orange = "#FFD064",
  pink = "#D997C8",
  purple = "#C397D8",
  red = "#F87070",
  yellow = "#FFE59E"
}

local mode_theme = {
  ["NORMAL"] = theme.green,
  ["OP"] = theme.cyan,
  ["INSERT"] = theme.aqua,
  ["VISUAL"] = theme.yellow,
  ["LINES"] = theme.darkred,
  ["BLOCK"] = theme.orange,
  ["REPLACE"] = theme.purple,
  ["V-REPLACE"] = theme.pink,
  ["ENTER"] = theme.pink,
  ["MORE"] = theme.pink,
  ["SELECT"] = theme.darkred,
  ["SHELL"] = theme.cyan,
  ["TERM"] = theme.lime,
  ["NONE"] = theme.gray,
  ["COMMAND"] = theme.blue
}
local function file_osinfo()
  local os = vim.bo.fileformat:upper()
  local icon
  if os == 'UNIX' then
    icon = ' '
  elseif os == 'MAC' then
    icon = ' '
  else
    icon = ' '
  end
  return icon .. os
end

local component = {}

component.vim_mode = {
  provider = function()
    return vim.api.nvim_get_mode().mode:upper()
  end,
  hl = function()
    return {
      fg = "bg",
      bg = require("feline.providers.vi_mode").get_mode_color(),
      style = "bold",
      name = "NeovimModeHLColor"
    }
  end,
  left_sep = "block",
  right_sep = "block"
}
component.fileinfo = {
  provider = {name = "file_info", opts = {type = "relative-short"}},
  hl = {style = "bold"},
  left_sep = " ",
  right_sep = "  "
}

component.git_branch = {
  provider = "git_branch",
  hl = {fg = "fg", bg = "bg", style = "bold"},
  left_sep = "block",
  right_sep = ""
}

component.git_add = {
  provider = "git_diff_added",
  hl = {fg = "green", bg = "bg"},
  left_sep = "",
  right_sep = ""
}

component.git_delete = {
  provider = "git_diff_removed",
  hl = {fg = "red", bg = "bg"},
  left_sep = "",
  right_sep = ""
}

component.git_change = {
  provider = "git_diff_changed",
  hl = {fg = "purple", bg = "bg"},
  left_sep = "",
  right_sep = ""
}

component.separator = {provider = "", hl = {fg = "bg", bg = "bg"}}

component.diagnostic_errors = {provider = "diagnostic_errors", hl = {fg = "red"}}

component.diagnostic_warnings = {provider = "diagnostic_warnings", hl = {fg = "yellow"}}

component.diagnostic_hints = {provider = "diagnostic_hints", hl = {fg = "aqua"}}

component.diagnostic_info = {provider = "diagnostic_info"}

component.lsp = {
  provider = function()
    if not rawget(vim, "lsp") then return "" end

    local progress = vim.lsp.util.get_progress_messages()[1]
    if vim.o.columns < 120 then return "" end

    local clients = vim.lsp.get_active_clients({bufnr = 0})
    if #clients ~= 0 then
      if progress then
        local spinners = {"◜ ", "◠ ", "◝ ", "◞ ", "◡ ", "◟ "}
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners
        local content = string.format("%%<%s", spinners[frame + 1])
        return content or ""
      else
        return "לּ LSP"
      end
    end
    return ""
  end,
  hl = function()
    local progress = vim.lsp.util.get_progress_messages()[1]
    return {fg = progress and "yellow" or "green", bg = "gray", style = "bold"}
  end,
  left_sep = "",
  right_sep = "block"
}

component.file_type = {
  provider = {name = "file_type", opts = {filetype_icon = true}},
  hl = {fg = "fg", bg = "gray"},
  left_sep = "block",
  right_sep = "block"
}
component.lsp_client_names = {
  provider = "lsp_client_names",
  hl = {fg = "green", bg = "bg", style = "bold"},
  left_sep = "left_filled",
  right_sep = "block"
}
component.file_encoding = {
  provider = "file_encoding",
  hl = {fg = "green", bg = "bg", style = "bold"},
  left_sep = "block",
  right_sep = "block"
}

component.os = {
  provider = file_osinfo,
  left_sep = ' ',
  right_sep = ' ',
  hl = {fg = 'green', style = 'bold'}
}
component.scroll_bar = {
  provider = function()
    local chars = {
      " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
      " ", " ", " ", " ", " ", " "
    }
    local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
    local position = math.floor(line_ratio * 100)

    if position <= 5 then
      position = " TOP"
    elseif position >= 95 then
      position = " BOT"
    else
      position = chars[math.floor(line_ratio * #chars)] .. position
    end
    return position
  end,
  hl = function()
    local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
                                    * 100)
    local fg
    local style

    if position <= 5 then
      fg = "aqua"
      style = "bold"
    elseif position >= 95 then
      fg = "red"
      style = "bold"
    else
      fg = "purple"
      style = nil
    end
    return {fg = fg, style = "bold", bg = "bg"}
  end,
  left_sep = "block",
  right_sep = "block"
}

local middle = {}
local right = {component.lsp_client_names, component.file_encoding, component.os}
local left = {
  component.vim_mode, component.fileinfo, component.file_type, component.lsp, component.git_branch,
  component.git_add, component.git_delete, component.git_change, component.separator,
  component.diagnostic_errors, component.diagnostic_warnings, component.diagnostic_info,
  component.diagnostic_hints, component.scroll_bar
}

local components = {active = {left, middle, right}}

feline.setup({components = components, theme = theme, vi_mode_colors = mode_theme})
