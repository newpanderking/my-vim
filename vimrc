
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" leader
let mapleader = ' '
let g:mapleader = ' '

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
" 支持粘贴内容到粘贴板
set clipboard=unnamed

" ===
" === Main code display
" ===
syntax enable
syntax on
set nu
set rnu
set ruler                       " show the current row and column
set cursorline      " 光标所在行

" Searching options
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir
set showcmd
set showmode                    " display current modes
set formatoptions-=tc

" show
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis
" Prevent auto line split
set wrap
set tw=0

set autoread                  " reload files when changed on disk, i.e. via `git checkout`

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

" plugin vim
source ~/code/my-vim/plug.vim

" color molokai
let g:codedark_conservative = 1
colorscheme codedark 

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
let g:airline_theme="bubblegum"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-H> :bp<CR>
nnoremap <C-L> :bn<CR>
nnoremap <C-C> :bd<CR>
" ======================= airline config end   ==========

" ======================= nerdtree config start ==========
" 设置快捷键
map tt :NERDTreeToggle<CR>
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" ======================= nerdtree config end ==========

" ======================= markdown config start ==========
nnoremap <F8> :MarkdownPreview<CR>
source ~/code/my-vim/markdown.vim
" ======================= markdown config end ==========

" plugin config
source ~/code/my-vim/leaderF.vim

" coc.vim 
source ~/code/my-vim/coc.vim
