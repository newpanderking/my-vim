

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" 主题
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 快速模糊查询
Plug 'Yggdroot/LeaderF',{'do': ':LeaderfInstallCExtension'}

" 自动补全神器
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 侧边栏
Plug 'preservim/nerdtree'

" markdown priview
" Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for':['markdown'] }

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
" Plug 'taglist.vim'

" Initialize plugin system
call plug#end()

"
