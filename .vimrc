set number
set autoindent
set shiftwidth=4
set smartindent
set smarttab	
set softtabstop=4
set ignorecase
set incsearch
set tabstop=4
set expandtab
set hls!
set directory=$HOME/.vim/swapfiles//
set nowrap
set foldmethod=indent

map <F4> :tabn<CR>
map <F3> :tabp<CR>
map GY "+y

" kill spaces
autocmd BufWritePre *.pl,*.pm,*.c,*.cpp,*.js,*.ts,*.java,*.php,*.sql %s/\s\+$//e
