" Author: Aryabhatta Dey
" Email:  aryabhattadey35@gmail.com

" Structure of my vimrc
" Plugins and their related functions and settings
" General settings
" Plugin keybindings
" General keybindings

" Install vim plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins and their related functions and settings
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Download three plugins only at a time
let g:plug_threads=3

" Lsp plugin
" Use the recommended release branch
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
" Coc extensions
let g:coc_global_extensions=[
        \ 'coc-calc',
        \ 'coc-clangd',
        \ 'coc-css',
        \ 'coc-cssmodules',
        \ 'coc-diagnostic',
        \ 'coc-emmet',
        \ 'coc-html-css-support',
        \ 'coc-htmlhint',
        \ 'coc-jedi',
        \ 'coc-json',
        \ 'coc-lists',
        \ 'coc-markdownlint',
        \ 'coc-pairs',
        \ 'coc-react-refactor',
        \ 'coc-sh',
        \ 'coc-spell-checker',
        \ 'coc-stylelintplus',
        \ 'coc-tailwindcss',
        \ 'coc-texlab',
        \ 'coc-tsserver',
        \ 'coc-ultisnips',
        \ 'coc-vimlsp',
        \ 'coc-vimtex',
        \ 'coc-word',
\]

" Coc settings
" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved
set signcolumn=number

" Set encoding to utf-8
set encoding=utf-8

" Tsserver has problems with backup
set nobackup
set nowritebackup

" Low updatetime for quicker display of messages
set updatetime=300

" Coc functions
" Use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Coc autocommands
augroup Coc
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Formatter plugin
Plug 'https://github.com/sbdchd/neoformat'
let g:neoformat_basic_format_retab=1  " Tabs get converted to spaces
let g:neoformat_basic_format_trim =1  " Trail whitespaces

" Lsp symbols plugin
Plug 'https://github.com/liuchengxu/vista.vim'
let g:vista_default_executive = "coc"
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 0
 let g:vista_sidebar_position = 'vertical topleft'

" Fuzzy finder plugin
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
Plug '/usr/local/opt/fzf' | Plug 'https://github.com/junegunn/fzf.vim'
" Disable the preview window
let g:fzf_preview_window=[]

" Snippet plugin | Snippet provider plugin
Plug 'https://github.com/SirVer/ultisnips' | Plug 'https://github.com/honza/vim-snippets'
let g:UltiSnipsSnippetDirectories =['~/.vim/ultisnips']
let g:UltiSnipsExpandTrigger      ='<nop>' " Let coc use tab and offer ultisnips completion
let g:UltiSnipsJumpBackwardTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger ='<c-k>'

" Wayland clipboard integration plugin
Plug 'https://github.com/christoomey/vim-system-copy'
let g:system_copy#copy_command ='wl-copy -n'  " Use wl-copy -n for copying
let g:system_copy#paste_command='wl-paste -n' " Use wl-paste -n for pasting
let g:system_copy_silent       =1             " Suppress system_copy message

" Plugin to align text in columns
Plug 'https://github.com/tommcdo/vim-lion.git'

" Latex plugin | Latex symbol conceal plugin
Plug 'https://github.com/lervag/vimtex', {'for': 'latex'} | Plug 'https://github.com/KeitaNakamura/tex-conceal.vim'
" Vimtex settings
let g:tex_flavor          ='latex' " To stop Vim from opening tex files as plaintex
let g:vimtex_quickfix_mode=0
let g:vimtex_view_method  ='zathura'
" Tex conceal settings
let g:tex_conceal='abdgms'
set conceallevel =2

" Plugin for commentig stuff out
Plug 'https://github.com/tpope/vim-commentary'

" Plugin for indentation guides
Plug 'https://github.com/Yggdroot/indentLine'
let g:indentLine_char      ='│'
let g:indentLine_color_term=249
let g:indentLine_setConceal=0

" Plugin for showing markdown output live
Plug 'https://github.com/suan/vim-instant-markdown', {'for': 'markdown'}

" Plugin to enhance netrw
Plug 'https://github.com/tpope/vim-vinegar'

" Plugin for easily edit parentheses
Plug 'https://github.com/tpope/vim-surround'

" Plugin for some common better mappings
Plug 'https://github.com/tpope/vim-unimpaired'

" Debugger plugin
Plug 'https://github.com/puremourning/vimspector'
let g:vimspector_enable_mappings='HUMAN'
let g:vimspector_install_gadgets=['debugpy', 'CodeLLDB']

" Plugin to visualize and traverse the undotree
Plug 'https://github.com/simnalamburt/vim-mundo', {'on': 'MundoToggle'}

" Plugin for emmet
Plug 'https://github.com/mattn/emmet-vim'

" Plugin to edit html tags quickly
Plug 'https://github.com/AndrewRadev/tagalong.vim'

" Plugin for highlighting mathcing html and jsx tags
Plug 'https://github.com/Valloric/MatchTagAlways'
let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'javascript': 1,
        \ 'xml' : 1,
\}

" PLugin for creating extra text objects
Plug 'https://github.com/wellle/targets.vim'

" Plugin for swapping text objects
Plug 'https://github.com/tommcdo/vim-exchange'

" Dependency for AdvancedSorters | Plugin for sorting functions, classes, switch case bloacks and so on
Plug 'https://github.com/inkarkat/vim-ingo-library' | Plug 'https://github.com/inkarkat/vim-AdvancedSorters'

" Plugin for sorting function arguments, classes, list elements and so on
Plug 'https://github.com/christoomey/vim-sort-motion'
let g:sort_motion_visual_block_command='Vissort'

" Plugin for splitting up and joining lines of code
Plug 'https://github.com/AndrewRadev/splitjoin.vim'

" Plugin to repeating certain other plugin's commands
Plug 'https://github.com/tpope/vim-repeat'

" Plugin for searching faster
Plug 'https://github.com/justinmk/vim-sneak'

" Plugin for split management
Plug 'https://github.com/spolu/dwm.vim'

call plug#end()

" General settings

" Create viminfo file in .cache instead of $HOME
set viminfo+=n~/.cache/vim/viminfo

" Opposite of J
function! BreakHere()
	s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
	call histdel("/", -1)
endfunction

filetype plugin indent on
syntax enable

augroup MyVimrc
        autocmd!
        autocmd FileType css        setlocal shiftwidth=2 softtabstop=2 expandtab
        autocmd FileType html       setlocal shiftwidth=2 softtabstop=2 expandtab
        autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
        " To get comment highlighting in json files
        autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

set autoindent " Copies indentation automatically from last line

set backspace=eol,indent,start " Allow backspacing over end of line, indentation inserted by autoindent and text inserted before current insert started. Helpful during normal text editing

set expandtab " Insert spaces instead of tab

set shiftwidth=8 " For every level of indentation insert 8 spaces

set softtabstop=8 " With expandtab on softtabstop only adds the functionality of backspace treating the 8 spaces in an indentation as a single tab

set tabstop=8 " Tab (and not spaces as tabs) is 8 columns wide

" Wrapping long lines

set wrap linebreak " To wrap lines at the ending of words so that vim displays long single lines in multiple lines without changing the content of the file

set cursorline " Highlights or underlines current line depending on chosen colorscheme

set display+=lastline " Stops vim from replacing incomplete last lines with the @ symbol

set hidden " To allow us to open new buffers without saving or quiting from the current buffer

" Searching
set hlsearch " Highlight search results
set incsearch " Search as characters are entered
" To turn off highlight in search after first enter
nnoremap <silent> <CR> :nohlsearch <CR>
set ignorecase " Search is case insensitive if no capital alphabets are used

set smartcase " If capital alphabets are used search is case sensitive

set relativenumber " Show relative line numbers. I tried absolute numbers and this is far quicker to give commands

set number " With relativenumber on shows the absolute number for the current line

set ruler " Shows position of cursor in the bottom right of the screen

set shortmess+=aIc " Disables intro and enter to continue messages

set showbreak=... " Shows where lines have been wrapped

set showcmd " Display an incomplete command in the lower right corner

set showmatch " When cursor is on top of a parenthesis the matching one will be highlighted

set wildmenu " To show possible completion items in a menu

set wildignorecase " Wildmode searching is case insensitive if no capital alphabets are used

set undofile " Save undos after file closes

set undodir=$HOME/.cache/vim/undo " Where to save undo histories

" Colorscheme
set background=dark
highlight link CocFloating markdown
highlight Sneak ctermfg=0 ctermbg=11

" Plugin Keybindings

" Leader
let mapleader=','

" Plugin keybindings
" Coc keybindings
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use tab and shift tab to navigate completion  list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm the currently selected confirmed completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> <leader>p <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>n <Plug>(coc-diagnostic-next)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-rename)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <silent> <leader>t <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
" Mapping to apply code-action to whole buffer
nmap <leader>ab  <Plug>(coc-codeaction)
" Mapping to apply codeaction to a text object or selection
nmap <silent> <leader>a <Plug>(coc-codeaction-selected)
xmap <silent> <leader>a <Plug>(coc-codeaction-selected)
" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
" Apply AutoFix to problem on the current line
nmap <leader>qf <Plug>(coc-fix-current)
" To select classobj or funcobj do operator/visual mode af/if/ic/ac
" Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Formatting selected code
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)
" Show all diagnostics at once
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" Fzf keymappings
nnoremap <leader>f  :Files<CR>
nnoremap <leader>ff :Files ~<CR>
nnoremap <leader>bb  :Buffer<CR>
nnoremap <leader>rg :Rg
nnoremap <leader>h  :History<CR>

" Ultisnips mapping
function! UltisnipsRemoveText()
        normal x?\\textd2wx
endfunction
nnoremap <leader>u :call UltisnipsRemoveText()<CR>

" System copy keybindings
" cp to copy
" cv to paste
" cP copy current line
" cV paste to next line
" cpiw to copy inside word
" cpi' to copy inside ''

"Vimspector keybindings
" F5            When debugging, continue. Otherwise start debugging.
" F3            Stop debugging.
" F4            Restart debugging with the same configuration.
" F6            Pause debuggee.
" F9            Toggle line breakpoint on the current line.
" <leader>F9    Toggle conditional line breakpoint on the current line.
" F8            Add a function breakpoint for the expression under cursor
" <leader>F8    Run to Cursor
" F10           Step Over
" F11           Step Into
" F12           Step out of current function scope
" mnemonic 'di' = 'debug inspect'
" for normal mode - the word under the cursor
nnoremap <leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xnoremap <leader>di <Plug>VimspectorBalloonEval
nnoremap <LocalLeader><F11> <Plug>VimspectorUpFrame
nnoremap <LocalLeader><F12> <Plug>VimspectorDownFrame

" Vista keybindings
" Show symbols
nnoremap <leader>s :Vista!!<CR>
nnoremap <leader>ss :Vista finder coc<CR>

" Mundo keybindings
nnoremap <leader>m :MundoToggle<CR>

" AdvancedSorters
" to sort for python functions do :SortRangesByHeaders /def/
" to sort plain English words in a single line do :SortWORDs or :SortEach/delimiter-pattern/joiner

" Dwm keybindings
" C-N Create a new master split
" C-C Close current split if no unsaved changes
" C-J Jumps to next split (clockwise)
" C-K Jumps to previous split (anti-clockwise)
" C-Space Focus the current split

" General keybindings

" Marks and registers
" Display active marks and the location they point to
nnoremap <leader>` :<C-u>marks<CR>:normal! `
" Display the non-empty registers and their content
nnoremap <leader>@ :<C-u>registers<CR>:normal! `

" Buffers
" use <c-o> and <c-i> to cycle through the jump list
" use <c-]> and <c-^> to cycle through the tag  list
" <c-^> can also be used to cycle between the current and previous buffer
nnoremap <leader>bd :bd<cr>
nnoremap <leader>b :b 

" Opposite of J
nnoremap <leader>J :<C-u>call BreakHere()<CR>
