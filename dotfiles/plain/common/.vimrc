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
set updatetime=100

inoremap jk <Esc>

" cursor control
let &t_SI = "\e[4 q"
let &t_EI = "\e[4 q"

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
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" onedark
" Uncomment this to have transparent background
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) 
    " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

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
nmap <leader>gd <plug>(YCMHover)

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

" NERDTree 
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

nnoremap <F2> :NERDTreeToggle<CR>

" fzf.vim
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6, 'yoffset': 0.5 } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --multi'

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

nnoremap <silent> <leader>o :Files<CR>
