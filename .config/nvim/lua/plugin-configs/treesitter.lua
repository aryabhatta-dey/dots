-- The org parser gives error. Prolly not ready yet
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}

require("nvim-treesitter.configs").setup({
	ensure_installed = { "bash", "cpp", "lua", "org", "python" }, -- do not install latex parser. Then vimtex won't work. Refer to https://github.com/lervag/vimtex/issues/2278
	highlight = {
		enable = true,
		disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
		additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
	},
	autopairs = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selecnion = "gnn",
			node_incremental = ".",
			scope_incremental = "grc",
			node_decremental = ".",
		},
	},
	indent = {
		enable = true,
	},
})
