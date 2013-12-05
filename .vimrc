set nocompatible

function! s:mkdir_if_not_exists(dir)
  let dir = expand(a:dir)
  if !isdirectory(dir)
    call mkdir(dir, 'p')
  end
  return dir
endfunction

execute 'set backupdir=' . s:mkdir_if_not_exists('~/.vim/backupdir')

set laststatus=2
set hlsearch
set nowrapscan
set ignorecase
set smartcase

nnoremap <Space>w :<C-u>write<C-m>
nnoremap <Space>q :<C-u>quit<C-m>
nnoremap <Space>e :<C-u>vsplit .<C-m>
nnoremap <Space>E :<C-u>vsplit %:p:h<C-m>
nnoremap <Space>op :<C-u>setlocal paste!<C-m>:setlocal paste?<C-m>
nnoremap <Space>ow :<C-u>setlocal wrap!<C-m>:setlocal wrap?<C-m>

