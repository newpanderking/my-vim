" leader
let mapleader = ','
let g:mapleader = ','

syntax on

set rnu
set hlsearch
set autoindent
set smartindent
" show location
" set cursorcolumn  " 光标所在列
set cursorline      " 光标所在行
" show
set ruler                       " show the current row and column
set nowrap
set showcmd                     " display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis

set nocompatible              " be iMproved, required
set autoread                  " reload files when changed on disk, i.e. via `git checkout`

" 支持粘贴内容到粘贴板
set clipboard=unnamed
" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix,dos,mac
set formatoptions+=m
set formatoptions+=B

" select & complete
set selection=inclusive
set selectmode=mouse,key

set completeopt=longest,menu
set wildmenu                           " show a navigable menu for tab completion"
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class

" others
set backspace=indent,eol,start  " make that backspace key work the way it should
set whichwrap+=<,>,h,l

" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype on                  " required
" Enable filetype plugins
filetype plugin on
filetype indent on

" plugin vim
source ~/code/my-vim/plugin.vim

set laststatus=2
set t_Co=256
set encoding=utf8
set background=dark
color molokai
let g:molokai_original=1
let g:rehash256=1

" ============================ specific file type ===========================
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
	" .sh
	if &filetype == 'sh'
		call setline(1, "\#!/bin/bash")
	endif

	" python
	if &filetype == 'python'
		call setline(1, "\#!/usr/bin/env python")
		call append(1, "\# encoding: utf-8")
	endif
	normal G
	normal o
	normal o
endfunc
" ============================ key map ============================

" select all
map <Leader>sa ggVG"
" ctrl + s 保存
nmap <C-S> :w<CR>
imap <C-S> <ESC>:w<CR>i

" Shift+H goto head of the line, Shift+L goto end of the line
nnoremap H ^
nnoremap L $

nnoremap <F2> :set rnu! rnu?<CR>
" <F3> is nerdtree key bind in nerdtree.vim 
nnoremap <F4> :set wrap! wrap?<CR>
set pastetoggle=<F5>
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" command mode, ctrl-a to head， ctrl-e to tail
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" git gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" ======================= airline config start ==========
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-H> :bp<CR>
nnoremap <C-L> :bn<CR>
nnoremap <C-C> :bd<CR>
" ======================= airline config end   ==========

" plugin config
source ~/code/my-vim/leaderF.vim

" nerdtree.vim 
source ~/code/my-vim/nerdtree.vim

" coc.vim 
source ~/code/my-vim/coc.vim

" mark down preview
let vim_markdown_preview_github=1
