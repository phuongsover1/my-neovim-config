vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" },
				},
			})
		end,
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	})
	use({ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" })
	use({ "folke/tokyonight.nvim" })
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } })
	use("nvim-tree/nvim-web-devicons")
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("onsails/lspkind.nvim")
	use("folke/which-key.nvim")
	use("p00f/nvim-ts-rainbow")
	use("lukas-reineke/indent-blankline.nvim")
	use("rafamadriz/friendly-snippets")
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use("norcalli/nvim-colorizer.lua")
	use("lewis6991/gitsigns.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("terrortylor/nvim-comment")
	use({ "folke/zen-mode.nvim", config = "require('zen-mode-config')" })
	use({ "folke/twilight.nvim", config = "require('twilight-config')" })
	use("matbme/JABS.nvim")
	use({ "kylechui/nvim-surround", tag = "*" })
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			-- local highlights = require('rose-pine.plugins.toggleterm')
			require("toggleterm").setup({
				size = 15,
				open_mapping = [[<c-\>]],
				direction = "horizontal",
				-- highlights = highlights,
			})
		end,
	})
	use({ "ckipp01/stylua-nvim" })
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
		requires = { { "nvim-tree/nvim-web-devicons" } },
	})
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup()
		end,
	})
	use({
		"tversteeg/registers.nvim",
		config = function()
			require("registers").setup()
		end,
	})
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end,
	})
	use({
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
			require("scrollbar.handlers.search").setup({
				-- hlslens config overrides
			})
		end,
	})
	use({
		"echasnovski/mini.indentscope",
		config = function()
			require("mini.indentscope").setup()
		end,
	})
	use("feline-nvim/feline.nvim")
	use("HiPhish/nvim-ts-rainbow2")
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use("justinmk/vim-sneak")
	use("jay-babu/mason-null-ls.nvim")
	use("RRethy/vim-illuminate")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"LeonHeidelbach/trailblazer.nvim",
		config = function()
			require("trailblazer").setup({
				-- your custom config goes here
			})
		end,
	})
	use("j-hui/fidget.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
end)
