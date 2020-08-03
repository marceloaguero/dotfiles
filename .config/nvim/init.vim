set nocompatible        " Do not mantain compatibility wiht vi
syntax on

set noerrorbells
set smarttab            " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set expandtab			" Convert <tab> to spaces
set tabstop=4			" Spaces per tab
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set number		    	" Show current line number
set relativenumber		" Show relatives line numbers (from current line)
set showmatch           " Show matching braces
set scrolloff=3			" Keep at least N lines below cursor
set nowrap			    " Don't cut long lines
set backspace=indent,eol,start  " Sane backspace behaviour
set encoding=utf-8
set incsearch           " Incremental searching
set smartcase           " Case insensitive search if using lowercase letters
set background=dark

set shell=/bin/zsh

" Swap and undos
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" Key bindings and shortcuts
let mapleader = " "		" map space as leader
nnoremap <leader>w :w<cr>
inoremap jk <ESC>		" jk as esc key

nnoremap <leader>h :wincmd h<cr>   " Jump to left buffer
nnoremap <leader>j :wincmd j<cr>   " Jump to bottom buffer
nnoremap <leader>k :wincmd k<cr>   " Jump to top buffer
nnoremap <leader>l :wincmd l<cr>   " Jump to right buffer

nnoremap <leader>u :UndotreeShow<cr>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<cr>

" Plugins
" vim-plug (https://github.com/junegunn/vim-plug)
call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'vifm/vifm.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mbbill/undotree'

call plug#end()

" colorscheme nord
colorscheme onedark

" Specific configurations for lightline.vim plugin
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch'],
  \             [ 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
  \ }

" vim-go
set autowrite
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_fmt_command = "goimports"

