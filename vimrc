if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

function! s:mkdir_if_not_exists(dir)
  let dir = expand(a:dir)
  if !isdirectory(dir)
    call mkdir(dir, 'p')
  end
  return dir
endfunction

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'bouzuya/vim-diary'

filetype plugin indent on

execute 'set backupdir=' . s:mkdir_if_not_exists('~/.vim/backupdir')
execute 'set directory=' . s:mkdir_if_not_exists('~/.vim/directory')

set fileformat=unix
set fileencoding=utf-8
set laststatus=2
set hlsearch
set nowrapscan
set ignorecase
set smartcase
set shiftwidth=2
set expandtab
set listchars=eol:$,tab:>-
set colorcolumn=80

nnoremap <Space>w :<C-u>write<C-m>
nnoremap <Space>q :<C-u>quit<C-m>
nnoremap <Space>e :<C-u>vsplit .<C-m>
nnoremap <Space>E :<C-u>vsplit %:p:h<C-m>
nnoremap <Space>dn :<C-u>call diary#new()<C-m>
nnoremap <Space>ol :<C-u>setlocal list!<C-m>:setlocal list?<C-m>
nnoremap <Space>op :<C-u>setlocal paste!<C-m>:setlocal paste?<C-m>
nnoremap <Space>ow :<C-u>setlocal wrap!<C-m>:setlocal wrap?<C-m>

