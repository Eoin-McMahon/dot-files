call plug#begin("~/.config/nvim/plugged") 
	Plug 'morhetz/gruvbox'
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'tpope/vim-commentary'
    Plug 'martinda/Jenkinsfile-vim-syntax'
    Plug 'mbbill/undotree'
    Plug 'Yggdroot/indentLine'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'Xuyuanp/nerdtree-git-plugin' 
    Plug 'tpope/vim-surround'
	Plug 'ryanoasis/vim-devicons'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'w0rp/ale'
    Plug 'sheerun/vim-polyglot'
	Plug 'mhinz/vim-startify'
	Plug 'itchyny/lightline.vim'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

map s <Nop>
noremap <leader>p "+p

" " Line moving
" -- Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" -- Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" -- Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s

" NERDTree
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$',"build/*", "^.DS_Store$"] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
:let g:NERDTreeWinSize=45
" " Toggle
noremap <silent> <C-n> :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <leader>n :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Lightline
let g:lightline = {
  \     'colorscheme': 'powerlineish',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }
"
" Numbering
set number relativenumber nu

"Disable droplet beep sound (i.e end of file and on command)
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
set foldmethod=indent
set foldlevel=20


" Update time for signify
autocmd ColorScheme * highlight! link SignColumn LineNr
set updatetime=100

" Automatic Syntax for code
syntax on
set laststatus=2
" Dont wrap long lines
set nowrap
set smarttab
" Use spaces instead of tabs
set expandtab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set autoindent smartindent "Smart automatic indent
" Don't create swap files
set noswapfile
" Search iteratively
set incsearch
" enable mouse clicks
set mouse=a

" disbale capital q and w commands
cabbrev W w
cabbrev Q q

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <BS> i<BS><Esc>`^
"Make tab go to the matching pair item
nnoremap <Tab> %
" map r to redo
noremap r <C-r>
" map ctrl r to scroll up, since scroll down is ctrl e
noremap <C-r> <C-y>

nnoremap <Space> <NOP>

let mapleader=" "
"  space space will switch to the most recent buffer (good when working with two files)
noremap <leader><leader> :e #<CR>
"
" Vim Commentary {
nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cl <Plug>CommentaryLine<CR>
" }

nnoremap <C-p> :GFiles<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"Jenkins file syntax highlighing
au BufNewFile,BufRead Jenkinsfile setf groovy

set undodir=~/.config/nvim/undodir " set undotree file directory
set undofile " set undotree to save to file
nnoremap <leader>u :UndotreeShow<CR>

" terminal escape key
:tnoremap <Esc> <C-\><C-n>
