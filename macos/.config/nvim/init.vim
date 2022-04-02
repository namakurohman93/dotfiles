" installed vim plugins --- {{{

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'unblevable/quick-scope'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

call plug#end()

" --- }}}


" global custom settings --- {{{

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
endif

if !exists('g:syntax_on')
    syntax enable
endif

colorscheme dracula
filetype plugin indent on

" autocmd insertenter * silent execute "!echo -en \<esc>[3 q"
" autocmd insertleave * silent execute "!echo -en \<esc>[2 q"
augroup global_settings
    autocmd!
    autocmd bufwritepre *
        \ if !isdirectory(expand('<afile>:p:h'))        |
            \ call mkdir(expand('<afile>:p:h'), 'p')    |
        \ endif
    " disabled automatic comment insertion
    autocmd filetype * setlocal formatoptions-=cro
augroup end

" let &t_SI="\<esc>[3 q"
" let &t_EI="\<esc>[2 q"

" --- }}}


" global custom options --- {{{

if has('nvim')
    set guicursor=n-o-c-ci-cr-sm:block,i-v-ve:hor30
endif

if has('termguicolors')
  set termguicolors
endif

set termguicolors
set number
set numberwidth=5
set laststatus=2
set expandtab
" set shiftwidth=2
" set softtabstop=2
set ttimeoutlen=0
set nobackup
set noswapfile
" set cmdheight=2
set re=0 " fix redrawtime exceeded syntax highlighting disabled
set noshowmode
set incsearch
set nohlsearch
set cursorline
set colorcolumn=80
set hidden " enable to open new buffer when there is a changes on current buffer

" --- }}}


" global custom mappings --- {{{

let mapleader="\<space>"

noremap <space> <nop>
noremap H <s-^>
noremap J G
noremap K gg
noremap L <s-$>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <leader>u viwue
nnoremap <leader>U viwUe
nnoremap <leader>r :e<cr>
nnoremap <leader>, <c-w><
nnoremap <leader>. <c-w>>
nnoremap <leader>/ /\c
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>ff :GFilesWithHiddenPreview<cr>
nnoremap <leader>fl :BufferWithHiddenPreview<cr>
nnoremap <leader>fw :Rg<space>
nnoremap <leader>few :RgExactWord<space>
nnoremap <leader>* :RgCurrentWord<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bd :BD<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>fn :enew<cr>
nnoremap <leader>tn :set number!<cr>

inoremap <c-u> <esc>viwuea
inoremap <c-U> <esc>viwUea

" --- }}}


" auto-pairs custom settings --- {{{

let g:AutoPairsCenterLine=0
let g:AutoPairsMapCR = 0

" --- }}}


" lightline custom settings --- {{{

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

" --- }}}


" quick-scope custom settings --- {{{

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" --- }}}


" nerdtree custom settings --- {{{

let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['^\.git$', '^\.github$', '^\.vscode$']

augroup nerdtree_custom_settings
    autocmd!
    autocmd bufenter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup end

" --- }}}


" nerdcommenter custom settings --- {{{

let g:NERDSpaceDelims=1

" --- }}}


" fzf custom settings --- {{{

command! RgCurrentWord
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --word-regexp -- ' . shellescape(expand('<cword>')),
    \   1,
    \   fzf#vim#with_preview(),
    \   0
    \ )

command! -nargs=* RgExactWord
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --word-regexp -- ' . shellescape(<q-args>),
    \   1,
    \   fzf#vim#with_preview(),
    \   0
    \ )

command! BufferWithHiddenPreview
    \ call fzf#vim#buffers(
    \   fzf#vim#with_preview('right:50%:hidden', 'ctrl-_'),
    \   0
    \ )

command! -nargs=? GFilesWithHiddenPreview
    \ call fzf#vim#gitfiles(
    \   <q-args>,
    \   fzf#vim#with_preview('right:50%:hidden', 'ctrl-_'),
    \   0
    \ )

" --- }}}


" vimscript filetype settings --- {{{

augroup filetype_vim
    autocmd!
    autocmd bufnewfile,bufread *.vimrc set filetype=vim
    autocmd bufnewfile,bufread *.vim set filetype=vim
    autocmd filetype vim :call <sid>VimCustomSettings()
augroup end

function! s:VimCustomSettings()
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal foldmethod=marker
endfunction

" --- }}}


" javascript (and its derivatives) filetype settings --- {{{

augroup filetype_js
    autocmd!
    autocmd filetype javascript,typescript,javascriptreact,typescriptreact :call <sid>JavascriptCustomSettings()
augroup end

function! s:JavascriptCustomSettings()
    setlocal shiftwidth=2
    setlocal softtabstop=2
    setlocal foldmethod=syntax
    setlocal foldlevel=99
    let javascript_fold=1
endfunction

" --- }}}


" JSON filetype settings --- {{{

augroup filetype_json
    autocmd!
    autocmd filetype json :call <sid>JsonCustomSettings()
augroup end

function! s:JsonCustomSettings()
    setlocal foldmethod=syntax
    setlocal foldlevel=99
endfunction

" --- }}}

" go filetype settings --- {{{
augroup filetype_go
    autocmd!
    autocmd filetype go :call <sid>GoCustomSettings()
augroup end

function! s:GoCustomSettings()
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal foldmethod=syntax
    setlocal foldlevel=99
endfunction

" --- }}}
