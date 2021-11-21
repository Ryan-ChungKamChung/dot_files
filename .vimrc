" Non-compatible with Vi
set nocompatible

" Sets up Vungle and enables all plugins
" :PluginInstall after all plugin installations/deletions
filetype off
packloadall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on


"IDE-like features
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set expandtab
set textwidth=79
set number
syntax on

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set magic

" Brackets
inoremap "  ""<ESC>hli
inoremap '  ''<ESC>hli
inoremap (  ()<ESC>hli
inoremap [  []<ESC>hli
inoremap {  {}<ESC>hli
set showmatch

" Visual modifications
set splitbelow
autocmd VimEnter * NERDTree 
let g:NERDTreeWinPos = "right"

" Airline Plugin
" Tabline
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1

" Populates g:airline_symbols to show them in the GUI
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" What the symbols should be
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Swift Syntax Highlighting
map <C-I> :pyf ~/.vim/plugin/swift-format.py
imap <C-I> <c-o>:pyf ~/.vim/plugin/swift-format.py

" Commands
:command NERD NERDTreeToggle
