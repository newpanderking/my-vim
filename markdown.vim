
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开markdown 文件的时候打开一次
let g:mkdp_auto_start = 1

" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预览窗口
let g:mkdp_auto_open = 1

" 实时预览
let g:mkdp_refresh_slow = 0
" 前缀锚点 
autocmd Filetype markdown inoremap ,, <++>
" markdown key-map config
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" 横线
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
" 加粗
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
" 删除线
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
" 斜体
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
" 行内代码块
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i

" 代码块
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA

autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
" 图片
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
" a标签
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
" 1 号标题
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
" 2 号标题
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
" 3 号标题
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
" 4 号标题
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
" 横线
autocmd Filetype markdown inoremap ,l --------<Enter>


" table mode config
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
