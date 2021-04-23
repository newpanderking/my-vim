" ======================= coc config start ==========

" coc 默认安装插件
let g:coc_global_extensions = ['coc-html','coc-css', 'coc-json',
            \ 'coc-java','coc-python', 'coc-prettier',
            \ 'coc-emmet','coc-snippets','coc-xml','coc-yaml',
            \ 'coc-highlight']


" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ======================= coc config end   ==========
