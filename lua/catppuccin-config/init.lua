require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = {
		-- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = { "italic" },
		keywords = { "italic" },
		strings = {},
		variables = { "italic" },
		numbers = {},
		booleans = {},
		properties = { "italic" },
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = true,
		fidget = true,
		lsp_saga = true,
		mason = true,
		treesitter = true,
		treesitter_context = true,
		vim_sneak = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
