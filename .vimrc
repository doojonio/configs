"----------------------------------------"
" Autoload plugin manager
"----------------------------------------"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"----------------------------------------"
" Setup plugins
"----------------------------------------"
call plug#begin('~/.vim/plugged')
Plug 'gryf/wombat256grf'
Plug 'junegunn/vim-easy-align'
Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-eunuch'
Plug 'challenger-deep-theme/vim'
Plug 'vim-perl/vim-perl'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'mtdl9/vim-log-highlighting'
Plug 'rakr/vim-one'
call plug#end()
"----------------------------------------"
" Helpers declaration
"----------------------------------------"
function SetupOtrsHotkeys()
  imap ;om $Kernel::OM->Get('Kernel::System::')<Left><Left>
  imap ;err $Kernel::OM->Get('Kernel::System::Log')->Log(<CR>Priority => 'error',<CR>Message  => '',<CR>);<Up><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right><Right>
  imap ;dmp use Data::Dumper; $Data::Dumper::Sortkeys = 1;<CR>print STDERR Dumper ;<Left>
  imap ;cnt use feature 'state'; state $COUNTER = 1; print STDERR '$COUNT = '.$COUNTER++."\n";
endfunction

function SetupPhpHotkeys()
  imap ;dmp var_dump();<Left><Left>
endfunction

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

function! NewPerlScript()

    call setline( line('$'), '#!/usr/bin/env perl' )
    call append( line('$'), ['', 'use strict;'] )
    call append( line('$'), [ 'use warnings;' ] )
    call append( line('$'), [ 'use v5.30;', '', '' ] )

    call cursor( line('$'), 0 )

    call feedkeys('i')
endfunction
"----------------------------------------"
" Some in-vim settings
"----------------------------------------"
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
set cursorline
set autochdir
set hlsearch
set shiftwidth =2
set softtabstop=2
set tabstop    =2
"----------------------------------------"
" Hotkeys
"----------------------------------------"
map <F2> :tabnew<CR>
map <F4> :tabn<CR>
map <F3> :tabp<CR>
map GY "+y
map M! :call TabEq2()<CR>
map M@ :call TabEq4()<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"----------------------------------------"
" Auto-execution
"----------------------------------------"
autocmd BufWritePre *.pl,*.t,*.pm,*.c,*.cpp,*.js,*.ts,*.java,*.php,*.sql FixWhitespace
autocmd BufReadPre *.ts,*.js call TabEq2()
autocmd BufNewFile *.pl :call NewPerlScript()
autocmd BufReadPre /opt/otrs/*.pm,/opt/otrs/*.pl,/opt/otrs/*.t call SetupOtrsHotkeys()
autocmd BufReadPre *.php call SetupPhpHotkeys()
autocmd BufReadPre *.tt se syntax=html
autocmd BufReadPre /opt/otrs/* call TabEq4()
autocmd BufReadPre *.log.?* se syntax=log
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif
"----------------------------------------"
" Variables for plugin's settings
"----------------------------------------"
let perl_sub_signatures = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"----------------------------------------
" Setup colors
"----------------------------------------
colorscheme one
set background=dark
hi Normal ctermbg=none
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
hi Visual term=reverse cterm=reverse guibg=Grey
hi Pmenu ctermfg=15 ctermbg=0
hi Comment ctermfg=152
