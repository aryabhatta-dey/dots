-- To stop Vim from opening tex files as plaintex
vim.api.nvim_command("let g:tex_flavor = 'latex'")
vim.api.nvim_command("let g:vimtex_quickfix_mode=0")
vim.api.nvim_command("let g:vimtex_view_method = 'zathura'")
