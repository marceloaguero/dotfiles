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

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vifm/vifm.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' } " Replace fzf by skim
Plug 'lotabout/skim.vim' " Replace fzf by skim
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme nord
" colorscheme onedark
" colorscheme gruvbox

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

source $HOME/.config/nvim/plugins-configs/lightline.vim
source $HOME/.config/nvim/plugins-configs/nerdtree.vim
" source $HOME/.config/nvim/plugins-configs/fzf.vim
source $HOME/.config/nvim/plugins-configs/skim.vim
source $HOME/.config/nvim/plugins-configs/vim-go.vim
source $HOME/.config/nvim/plugins-configs/coc.vim
