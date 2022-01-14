local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	max_jobs = 4,
})

-- Install your plugins here
packer = require("packer").startup(function(use)
	-- Have packer manage itself
	use("wbthomason/packer.nvim")

	-- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/popup.nvim")

	--  Common lua functions used by lots of plugins
	use("nvim-lua/plenary.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Completion plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use("uga-rosa/cmp-dictionary")

	-- Autopairs plugin
	use("windwp/nvim-autopairs")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- for better performance

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Snippet plugins | Snippet provider plugin
	use({
		"SirVer/ultisnips",
		requires = { { "honza/vim-snippets", rtp = "." } },
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
			vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
			vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
			vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
			vim.g.UltiSnipsRemoveSelectModeMappings = 0
		end,
	})

	-- Plugin to align text in columns
	use("https://github.com/tommcdo/vim-lion.git")

	-- Latex plugin
	-- Latex symbol conceal plugin
	use({ "https://github.com/lervag/vimtex", ft = "tex" })
	use({ "https://github.com/KeitaNakamura/tex-conceal.vim", ft = "tex" })

	-- Plugin for commentig stuff out
	use("https://github.com/tpope/vim-commentary")

	-- Plugin for indentation guides
	use("lukas-reineke/indent-blankline.nvim")

	-- Plugin to enhance netrw
	use("https://github.com/tpope/vim-vinegar")

	-- Plugin for easily editing parentheses
	use("https://github.com/tpope/vim-surround")

	-- Plugin for some common better mappings
	use("https://github.com/tpope/vim-unimpaired")

	-- Plugin to visualize and traverse the undotree
	use({ "https://github.com/simnalamburt/vim-mundo", cmd = "MundoToggle" })

	-- Plugin to edit html tags quickly
	use("https://github.com/AndrewRadev/tagalong.vim")

	-- Plugin for highlighting mathcing html tag
	use("https://github.com/gregsexton/MatchTag")

	-- Plugin for creating extra text objects
	use("https://github.com/wellle/targets.vim")

	-- Plugin for swapping text objects
	use("https://github.com/tommcdo/vim-exchange")

	-- Dependency for AdvancedSorters
	-- Plugin for sorting functions, classes, switch case bloacks and so on
	use("https://github.com/inkarkat/vim-ingo-library")
	use("https://github.com/inkarkat/vim-AdvancedSorters")

	-- Plugin for sorting function arguments, classes, list elements and so on
	use("https://github.com/christoomey/vim-sort-motion")

	-- Plugin for splitting up and joining lines of code
	use("https://github.com/AndrewRadev/splitjoin.vim")

	-- Plugin to repeating certain other plugin's commands
	use("https://github.com/tpope/vim-repeat")

	-- Impaitainet.nvim for better faster loading
	use("lewis6991/impatient.nvim")

	-- Org
	use({
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup({})
		end,
	})

	use({
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup({
				symbols = { "◉", "○", "✸", "✿" },
			})
		end,
	})

	use({
		"lukas-reineke/headlines.nvim",
		config = function()
			require("headlines").setup()
		end,
	})

	use("dhruvasagar/vim-table-mode")

	use({ "michaelb/sniprun", run = "bash ./install.sh" })

	use("ThePrimeagen/refactoring.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

require("plugin-configs.autopairs")
require("plugin-configs.cmp")
require("plugin-configs.org")
require("plugin-configs.refactor")
require("plugin-configs.telescope")
require("plugin-configs.tex-conceal")
require("plugin-configs.ultisnips")
require("plugin-configs.vim-sort-motion")
require("plugin-configs.vimtex")

return packer
