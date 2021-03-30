call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'vue', 'jsx', 'html'] }
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'

Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

call plug#end()

" AutoPairs custom setting
au FileType jst let b:AutoPairs = AutoPairsDefine({'<%' : '%>', '<%=' : '%>', '<%-' : '%>'})
au FileType html let b:AutoPairs = AutoPairsDefine({'<%' : '%>', '<%=' : '%>', '<%-' : '%>'})

" NERDTree custom setting
let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['node_modules', '^\.git$', '*.sw?', '.cache',  '^build$', '.expo-shared', '.nyc_output']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" prettier custom setting
let g:prettier#autoformat = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'true'
" autocmd BufWritePre *.js,*.ts,*.css,*.less,*.scss,*.json,*.md,*.html,*.jsx Prettier

" emmet mapping
" <C-y> emmet leader key is already used by default for scrolling vim window
let g:user_emmet_leader_key='<C-K>'
let g:user_emmet_mode='iv'

let g:python_highlight_all = 1

" lightline custom setting
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'gitbranch', 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set nocompatible
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set smarttab
set number
set path+=**
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*
set wildignore+=/usr/**
set wildmenu
set laststatus=2
set noshowmode
set incsearch

set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//

set timeoutlen=1000 ttimeoutlen=0

syntax on
filetype plugin indent on

colorscheme onedark
" colorscheme one
" set background=light

au InsertEnter * silent execute "!echo -en \<esc>[3 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"
au BufNewFile,BufRead *.ejs set filetype=html
autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <C-U> <Esc>viwUea

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap H <S-^>
noremap J G
noremap K gg
noremap L <S-$>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <F5> :set hlsearch!<CR>

let mapleader = "\<space>"

noremap <Space> <NOP>

noremap <leader>U viwUe
noremap <leader>u viwue
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>ve :edit $MYVIMRC<cr>
noremap <leader>vs :source $MYVIMRC<cr>
noremap <leader>VUE :call PrintVueTemplate()<CR>ggdd
noremap <leader>HTML :call PrintHTMLTemplate()<CR>ggdd

vmap <leader>e, <C-K>,

function! PrintVueTemplate()
  r~/.vim/templates/vue-template.txt
endfunction

function! PrintHTMLTemplate()
  r~/.vim/templates/html-template.txt
endfunction
