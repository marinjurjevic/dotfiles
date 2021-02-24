" --------------------------
" GENERAL
" --------------------------
set nocompatible
set number
set autoindent
set expandtab 
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set signcolumn=yes
set laststatus=2

inoremap jk <Esc>

" --------------------------
" PLUGINS
" --------------------------
" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugins (vim-plug)

call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

call plug#end()

" onedark
syntax on
colorscheme onedark

" YouCompleteMe
let g:ycm_add_preview_to_completeopt="popup"

let g:ycm_extra_conf_globlist = ['~/code/*']
let g:ycm_always_populate_location_list = 1

let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'

nnoremap <leader>go :YcmCompleter GoTo<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Airline
let g:airline_section_c = ''

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_symbols = {}

" airline symbols
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '令'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = ' '
