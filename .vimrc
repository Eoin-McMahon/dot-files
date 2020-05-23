"   _______D             _                        ____   ____    _                                  
"  |_   __  |           (_)                      |_  _| |_  _|  (_)                                 
"    | |_ \_|   .--.    __    _ .--.    .--.       \ \   / /    __    _ .--..--.    _ .--.   .---.  
"    |  _| _  / .'`\ \ [  |  [ `.-. |  ( (`\]       \ \ / /    [  |  [ `.-. .-. |  [ `/'`\] / /'`\] 
"   _| |__/ | | \__. |  | |   | | | |   `'.'.        \ ' /      | |   | | | | | |   | |     | \__.  
"  |________|  '.__.'  [___] [___||__] [\__) )        \_/      [___] [___||__||__] [___]    '.___.' 
"  ================================================================================================


"  PLUGINS
filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox', {'as': 'gruv'}
call plug#end()

" Colour Scheme
colorscheme gruvbox
set background=dark

" Numbering
set number relativenumber nu 

"Disable droplet beep sound (i.e end of file and on command)
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Automatic Syntax for code
syntax on

" Dont wrap long lines
set wrap!

" Be smart when using tabs ;)
set smarttab
" Use spaces instead of tabs
set expandtab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500
set wrap "Wrap lines 
set autoindent smartindent "Smart automatic indent

" Don't create swap files
set noswapfile

" Search iteratively
set incsearch

" Map NERDTree to ctrl-n
map <C-n> :NERDTreeToggle<CR>


" Line Moving
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
" Disable Arrow keys -> you gotta learn hjkl somehow bro
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

