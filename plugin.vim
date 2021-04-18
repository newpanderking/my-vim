
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" 主题
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 快速模糊查询
Plugin 'Yggdroot/LeaderF',{'do': ':LeaderfInstallCExtension'}

" 自动补全神器
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" 侧边栏
Plugin 'preservim/nerdtree'

" markdown priview
Plugin 'JamshedVesuna/vim-markdown-preview'

" Plugin 'taglist.vim'

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
