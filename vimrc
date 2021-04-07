" leader
let mapleader = ','
let g:mapleader = ','

syntax on

set nu
set hlsearch
set autoindent
set smartindent
" show location
" set cursorcolumn  " 光标所在列
set cursorline      " 光标所在行
" show
set ruler                       " show the current row and column
set number                      " show line numbers
set nowrap
set showcmd                     " display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis

set nocompatible              " be iMproved, required
set autoread                  " reload files when changed on disk, i.e. via `git checkout`

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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'

Plugin 'SuperTab'
Plugin 'taglist.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set t_Co=256
set background=dark
color molokai
let g:molokai_original=1
let g:rehash256=1


let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口 

" ============================ specific file type ===========================

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd
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

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun


" json format 
command! Jsonf :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;sys.stdout.write(re.sub(r\"\\\u[0-9a-f]{4}\", lambda m:m.group().decode(\"unicode_escape\").encode(\"utf-8\"), sys.stdin.read()))"'


" ============================ key map ============================

" key-map
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
" select all
map <Leader>sa ggVG"

" Shift+H goto head of the line, Shift+L goto end of the line
nnoremap H ^
nnoremap L $


nnoremap <F2> :set nu! nu?<CR>
" nnoremap <F3> :set list! list?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
set pastetoggle=<F5>
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w<CR>

" command mode, ctrl-a to head， ctrl-e to tail
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

