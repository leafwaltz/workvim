if &compatible
    set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

"[auto complete based on ncm2]
    call dein#add('~/.cache/dein/repos/github.com/roxma/nvim-yarp')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-path')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-bufword')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-jedi')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/neco-syntax')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-syntax')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/neco-vim')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-vim')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/neosnippet.vim')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-neosnippet')
    call dein#add('~/.cache/dein/repos/github.com/ncm2/ncm2-highprio-pop')

"[file explorer based on defx.nvim]
    call dein#add('~/.cache/dein/repos/github.com/Shougo/defx.nvim')

"[color themes]
    call dein#add('~/.cache/dein/repos/github.com/morhetz/gruvbox')

"[advanced airline based on vim-airline]
    call dein#add('~/.cache/dein/repos/github.com/vim-airline/vim-airline')
    call dein#add('~/.cache/dein/repos/github.com/vim-airline/vim-airline-themes')

"[asyncrun.vim]
    call dein#add('~/.cache/dein/repos/github.com/skywind3000/asyncrun.vim')

"[indent line based on indentLine]
    call dein#add('~/.cache/dein/repos/github.com/Yggdroot/indentLine')

"[auto save based on vim-auto-save]
    call dein#add('~/.cache/dein/repos/github.com/907th/vim-auto-save')

"[advanced terminal based on neoterm]
    call dein#add('~/.cache/dein/repos/github.com/kassio/neoterm')

    call dein#end()
    call dein#save_state()
endif

"[user settings]
set number
set mouse=a
set termguicolors
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set textwidth=80
set wrap
set ruler
set showmatch
set incsearch
set ignorecase
set nobackup
set noswapfile
set autochdir
set noerrorbells
set history=1000
set autoread

let g:auto_save = 1

"[key maps]
let mapleader=','
"[@summary use 'F1' to open quickfix window]
map <silent> <F1> :call asyncrun#quickfix_toggle(8)<cr>
imap <silent> <F1> <Esc>:call asyncrun#quickfix_toggle(8)<cr>

"[@summary use 'F2' to open defx]
map <silent> <F2> :Defx<cr>
imap <silent> <F2> <Esc>:Defx<cr>i

"[@summary use 'F3' to close window]
map <silent> <F3> :q<cr>
imap <silent> <F3> <Esc>:q<cr>

"[@summary use 'F4' to close nvim]
map <silent> <F4> :wq<cr>
imap <silent> <F4> <Esc>:wq<cr>

"[@summary use 'F5' to toggle indent line]
map <silent> <F5> :IndentLinesToggle<cr>
imap <silent> <F5> <Esc>:IndentLinesToggle<cr>i

"[@summary use 'F6' to indent code]
map <silent> <F6> gg=G
imap <silent> <F6> <Esc>gg=Gi

"[@summary use 'ctrl-t' to create a new terminal]
nnoremap <silent> <C-t> :<C-u>exec 'Tnew'<cr>
"[@summary use 'ctrl-t-ctrl-t' to close all terminals]
nnoremap <silent> <C-t><C-t> :<C-u>exec 'TcloseAll!'<cr>
"[@summary use '3<leader>t to close terminal-3 etc.']
nnoremap <silent> <leader>t :<C-u>exec v:count.'Tclose'<cr>
"[@summary use '3<leader>T to clear terminal-3 etc.']
nnoremap <silent> <leader>T :<C-u>exec v:count.'Tclear'<cr>

"[auto complete]
"[[ncm2 setting]]
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone
"[[neosnippet setting]]
"[@summary use 'ctrl-k' to expand a snippet and use 'tab' to jump inside it]
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\     "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"[gui options]
call rpcnotify(0, 'Gui', 'Option', 'Popupmenu', 0)
call rpcnotify(0, 'Gui', 'Option', 'Tabline', 0)
call rpcnotify(0, 'Gui', 'Font', 'DejaVu Sans Mono:h15', 0)

"[color schemes]
"colorscheme desert
colorscheme gruvbox
set background=dark
"set background=light

"[defx]
call defx#custom#option('_', {
    \ 'winwidth': 20,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 0,
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1
    \ })

autocmd FileType defx call s:defx_user_settings()
function! s:defx_user_settings() abort
	" Define mappings
	nnoremap <silent><buffer><expr> <CR>
	\ defx#do_action('drop')
	nnoremap <silent><buffer><expr> c
	\ defx#do_action('copy')
	nnoremap <silent><buffer><expr> m
	\ defx#do_action('move')
	nnoremap <silent><buffer><expr> p
	\ defx#do_action('paste')
	nnoremap <silent><buffer><expr> l
	\ defx#do_action('drop')
	nnoremap <silent><buffer><expr> E
	\ defx#do_action('drop', 'vsplit')
	nnoremap <silent><buffer><expr> P
	\ defx#do_action('drop', 'pedit')
	nnoremap <silent><buffer><expr> o
	\ defx#do_action('open_or_close_tree')
	nnoremap <silent><buffer><expr> K
	\ defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N
	\ defx#do_action('new_file')
	nnoremap <silent><buffer><expr> M
	\ defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> C
	\ defx#do_action('toggle_columns',
	\                'mark:indent:icon:filename:type:size:time')
	nnoremap <silent><buffer><expr> S
	\ defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> d
	\ defx#do_action('remove')
	nnoremap <silent><buffer><expr> r
	\ defx#do_action('rename')
	nnoremap <silent><buffer><expr> !
	\ defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> x
	\ defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> yy
	\ defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> .
	\ defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> ;
	\ defx#do_action('repeat')
	nnoremap <silent><buffer><expr> h
	\ defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~
	\ defx#do_action('cd')
	nnoremap <silent><buffer><expr> q
	\ defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space>
	\ defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> *
	\ defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> j
	\ line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k
	\ line('.') == 1 ? 'G' : 'k'
	nnoremap <silent><buffer><expr> <C-l>
	\ defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g>
	\ defx#do_action('print')
	nnoremap <silent><buffer><expr> cd
	\ defx#do_action('change_vim_cwd')
endfunction

"[vim-airline]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"[indentLine]
let g:indenLine_enabled = 1

"[vim-auto-save]
let g:auto_save_silent = 1 
let g:auto_save_events = ["InsertLeave", "TextChanged"]

"[neoterm]
let g:neoterm_size = 5 
let g:neoterm_default_mod = 'botright'

filetype plugin indent on
syntax enable
