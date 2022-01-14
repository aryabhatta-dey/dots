local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Clear highlight search
vim.api.nvim_set_keymap("n", "<CR>", ":nohlsearch <CR>", opts)

-- Mundo
vim.api.nvim_set_keymap("n", "<leader>m", ":MundoToggle<CR>", opts)

-- User defined mappings
-- Opposite of J
vim.api.nvim_set_keymap("n", "<leader>J", ":<C-u>call BreakHere()<CR>", opts)

-- Marks
vim.api.nvim_set_keymap("n", "<leader>`", ":<C-u>marks<CR>:normal! `", opts)

-- Registers
vim.api.nvim_set_keymap("n", "<leader>@", ":<C-u>registers<CR>:normal! `", opts)

-- Buffers
-- use <c-o> and <c-i> to cycle through the jump list
-- use <c-]> and <c-^> to cycle through the tag  list
vim.api.nvim_set_keymap("n", "gn", ":bnext<CR>", opts)
vim.api.nvim_set_keymap("n", "gp", ":bprevious<CR>", opts)

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>bb", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>o", ":Telescope oldfiles<CR>", opts)
