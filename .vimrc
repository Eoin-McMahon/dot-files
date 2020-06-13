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
Plug 'connorholyday/vim-snazzy'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'makerj/vim-pdf'
call plug#end()
" Colour Scheme
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Numbering
set number relativenumber nu

"Disable droplet beep sound (i.e end of file and on command)
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Automatic Syntax for code
syntax on
set laststatus=2
" Dont wrap long lines
set nowrap

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

"NERDTREE SETTINGS {{
map <C-n> :NERDTreeToggle<CR>
" Close NERDtree when files was opened
let NERDTreeQuitOnOpen=1
" Show NERDTree bookmarks
let NERDTreeShowBookmarks=1
" Display arrows instead of ascii art in NERDTree
let NERDTreeDirArrows=1
" Change current working directory based on root directory in NERDTree
let NERDTreeChDirMode=2
" Start NERDTree in minimal UI mode (No help lines)
let NERDTreeMinimalUI=1
let g:indentLine_char = '┊'
let g:NERDTreeWinSize=40

" }

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

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" FZF bindings
" search through files in directory
map <C-p> <Esc><Esc>:Files<CR>
" Search through lines in buffer
noremap <C-f> <Esc><Esc>:BLines<CR>
" Search through git tracked files. (handy since it ignores build files etc)
noremap <C-g> <Esc><Esc>:GFiles<CR>
"Make tab go to the matching pair item
nnoremap <Tab> %
" map r to redo
noremap r <C-r>
" map ctrl r to scroll up, since scroll down is ctrl e
noremap <C-r> <C-y>

let mapleader=" "
" Jump to definition
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

noremap z :Goyo<CR>
noremap Z :Goyo!<CR>
" Set nerdtree divider to empty character to remove the lines
set fillchars=
