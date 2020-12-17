"   EOIN'S VIMRC
" ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

" TO NOTE: I use vim-plug as my plugin manager, the config may also appear different dependent on machine
" An example is nerdtree which looks very different between linux and macos

" ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
"   PLUGINS
" ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'connorholyday/vim-snazzy'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'makerj/vim-pdf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
Plug 'lifepillar/vim-solarized8'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mhinz/vim-startify'
call plug#end()

" ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
"   CONFIGURATION
" ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

" Colour Scheme
set termguicolors

set background=dark
colorscheme gruvbox
" let g:gruvbox_sign_column='dark1'
" set bg=dark
highlight SignColumn ctermbg=NONE cterm=NONE guibg=#3c3836 gui=NONE

set synmaxcol=0
" Numbering
set number relativenumber nu

highlight CursorLine guibg=#3c3836
set cursorline
autocmd InsertEnter * highlight CursorLine guifg=white guibg=#689d6a ctermfg=white ctermbg=blue 
autocmd InsertEnter * highlight CursorLineNr guifg=white guibg=#689d6a ctermfg=white ctermbg=blue 
autocmd InsertLeave * highlight CursorLine guifg=white guibg=#3c3836 ctermfg=white ctermbg=darkblue
autocmd InsertLeave * highlight CursorLineNr guifg=white guibg=#3c3836 ctermfg=white ctermbg=blue 

"Disable droplet beep sound (i.e end of file and on command)
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

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

let g:ycm_semantic_triggers = { 'cpp': [ 're!.' ] }

" Linebreak on 500 characters
set lbr
set tw=500
set autoindent smartindent "Smart automatic indent

" Don't create swap files
set noswapfile

" Search iteratively
set incsearch

" Set nerdtree divider to empty character to remove the lines
set fillchars=

" ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌
"   KEY MAPPINGS AND REMAPPINGS
" ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

"NERDTREE SETTINGS {{
" Base where vim was opened
map <C-n> :NERDTreeToggle<CR>
" Location of file in buffer
" map <C-n> :NERDTreeFind<CR>
" Close NERDtree when files was opened
let NERDTreeQuitOnOpen=1
" Show NERDTree bookmarks
" let NERDTreeShowBookmarks=1
" Display arrows instead of ascii art in NERDTree
let NERDTreeDirArrows=1
" Change current working directory based on root directory in NERDTree
let NERDTreeChDirMode=2
" Start NERDTree in minimal UI mode (No help lines)
"let NERDTreeMinimalUI=1
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

" Markdown preview. TODO this is broken, keep an eye on github issues
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" FZF bindings {
" search through files in directory
map <C-p> <Esc><Esc>:Files<CR>
" Search through lines in buffer
noremap <C-f> <Esc><Esc>:BLines<CR>
" Search through git tracked files. (handy since it ignores build files etc)
noremap <C-g> <Esc><Esc>:GFiles<CR>
" }

nnoremap <BS> i<BS><Esc>`^
"Make tab go to the matching pair item
nnoremap <Tab> %
" map r to redo[
noremap r <C-r>
" map ctrl r to scroll up, since scroll down is ctrl e
noremap <C-r> <C-y>

let mapleader=" "

" Jump to definition
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"Youcompleteme fix
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Vim Commentary
nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cl <Plug>CommentaryLine<CR>

" Zen mode toggle
noremap z :Goyo<CR>
noremap Z :Goyo!<CR>
let g:goyo_width = 140

cabbrev W w
cabbrev Q q

" when in insert mode; space space will switch to the most recent buffer (good when working with two files)
noremap <leader><leader> :e #<CR>

au BufNewFile,BufRead Jenkinsfile setf groovy
:set mouse=a
au BufNewFile,BufRead Jenkinsfile setf groovy
