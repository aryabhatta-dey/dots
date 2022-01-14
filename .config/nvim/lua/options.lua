local options = {
	-- Indentation
	tabstop = 8, -- maximum width of tab character (measured in spaces)
	shiftwidth = 8, -- size of indent (measured in spaces), should equal tabstop
	softtabstop = 8, -- should be same as tabstop and softtabstop
	expandtab = true, -- convert tabs to spaces
	smartindent = true, -- smart indenting on new line for C-like programs
	smarttab = true, -- tab infront of a line inserts blanks based on shiftwidth

	-- Number
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines

	-- Backspace
	backspace = "indent,eol,start",

	-- Searching
	incsearch = true, -- start searching on each keystroke
	hlsearch = true, -- highlight the search results
	ignorecase = true, -- ignore case when only lowercase alphabets are entered
	smartcase = true, -- ignore case when lowercase, match case when capital case is used

	-- Cursor
	cursorline = true, -- highlight the current line

	-- Wrap
	wrap = true,
	linebreak = true,
	display = "lastline",
	showbreak = "...",

	-- used for CursorHold event (for faster completion)
	updatetime = 250, -- faster completion (4000ms default)

	-- Hidden
	hidden = true,

	-- Messages
	shortmess = "acTI",

	-- Parenthesis
	showmatch = true,

	-- Wildmenu
	wildignorecase = true,

	-- Undo
	undofile = true, -- enable persistent undo

	-- Signcolum
	signcolumn = "number", -- always show the sign column, otherwise it would shift the text each time

	-- Colorscheme
	background = "dark",

	-- Cursor
	guicursor = "i:block",

	-- Statusline
	laststatus = 0,

	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	fileencoding = "utf-8", -- the encoding written to a file
	scrolloff = 8,
	sidescrolloff = 8,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Colorscheme
-- vim.cmd[[colorscheme tokyonight]]
