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
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab

set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//

syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'vue', 'jsx', 'html'] }
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

call plug#end()

" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.ts,*.css,*.less,*.scss,*.json,*.md,*.html,*.jsx Prettier

let g:NERDTreeIgnore = ['node_modules', 'package-lock.json', '^\.git$', '.swp', '.cache',  'build', '.expo-shared', '.nyc_output']
let g:NERDTreeShowHidden = 1
let g:NERDSpaceDelims = 1

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'true'

let mapleader = "\<space>"

noremap <leader>n :NERDTreeToggle<CR>

vmap <leader>" S"
vmap <leader>' S'
vmap <leader>` S`
vmap <leader>( S)
vmap <leader>[ S]
vmap <leader>{ S}
vmap <leader>] S[
vmap <leader>} S{

noremap <Space> <NOP>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

inoremap <C-U> <Esc>viwUea
inoremap <C-l> <Esc>A

noremap <leader>U viwUe
noremap <leader>u viwue

noremap <leader>ve :vsplit $MYVIMRC<cr>
noremap <leader>vs :source $MYVIMRC<cr>
" noremap <leader>" viw<Esc>a"<Esc>bi"<esc>lel

noremap H <S-^>
noremap J G
noremap K gg
noremap L <S-$>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

function! PrintVueTemplate()
  r~/.vim/templates/vue-template.txt
endfunction

function! PrintHTMLTemplate()
  r~/.vim/templates/html-template.txt
endfunction

noremap <leader>VUE :call PrintVueTemplate()<CR>ggdd
noremap <leader>HTML :call PrintHTMLTemplate()<CR>ggdd

au InsertEnter * silent execute "!echo -en \<esc>[3 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"

" emmet mapping
" <C-y> emmet leader key is already used by default for scrolling vim window
let g:user_emmet_leader_key='<C-K>'
let g:user_emmet_mode='iv'
nmap <leader>e, i<C-K>,<Esc>
nmap <leader>ej i<C-K>j<Esc>

vmap <leader>e, <C-K>,

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'gitbranch', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

colorscheme industry

nnoremap <F5> :set hlsearch!<CR>
imap <C-a> <C-n>

au FileType jst let b:AutoPairs = AutoPairsDefine({'<%' : '%>', '<%=' : '%>', '<%-' : '%>'})

autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
