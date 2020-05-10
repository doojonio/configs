set number
set autoindent
set smartindent
set smarttab	
set ignorecase
set incsearch
set expandtab
set hls!
set directory=$HOME/.vim/swapfiles//
set nowrap
set foldmethod=indent

set shiftwidth =4
set softtabstop=4
set tabstop    =4

map <F4> :tabn<CR>
map <F3> :tabp<CR>
map GY "+y

" kill spaces
autocmd BufWritePre *.pl,*.pm,*.c,*.cpp,*.js,*.ts,*.java,*.php,*.sql %s/\s\+$//e
autocmd BufReadPre *.ts,*.js call TabEq2()

map M! :call TabEq2()<CR>
map M@ :call TabEq4()<CR>

function! TabEq2()
  set shiftwidth =2
  set softtabstop=2
  set tabstop    =2
endfunction

function! TabEq4()
  set shiftwidth =4
  set softtabstop=4
  set tabstop    =4
endfunction

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

call plug#begin('~/.vim/plugged')

Plug 'gryf/wombat256grf'
Plug 'junegunn/vim-easy-align'

call plug#end()

colorscheme wombat256grf
