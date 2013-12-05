set nocompatible

let s:backupdir = expand('~/.vim/backupdir')
if !isdirectory(s:backupdir)
  call mkdir(s:backupdir, 'p')
end
execute 'set backupdir=' . s:backupdir
unlet! s:backupdir

set laststatus=2
set hlsearch
set nowrapscan
set ignorecase
set smartcase

nnoremap <Space>w :<C-u>write<C-m>
nnoremap <Space>q :<C-u>quit<C-m>
nnoremap <Space>e :<C-u>vsplit .<C-m>
nnoremap <Space>E :<C-u>vsplit %:p:h<C-m>
nnoremap <Space>ow :<C-u>setlocal wrap!<C-m>:setlocal wrap?<C-m>

