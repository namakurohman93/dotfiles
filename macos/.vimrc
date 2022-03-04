" installed vim plugins --- {{{

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'tmsvg/pear-tree'
Plug 'unblevable/quick-scope'
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

call plug#end()

" --- }}}


" global custom settings --- {{{

if !exists('g:syntax_on')
    syntax enable
endif

colorscheme onedark
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

let &t_SI="\<esc>[3 q"
let &t_EI="\<esc>[2 q"

" --- }}}


" global custom options --- {{{

set number
set numberwidth=4
set laststatus=2
set expandtab
set shiftwidth=2
set softtabstop=2
set ttimeoutlen=0
set nobackup
set noswapfile
set cmdheight=2
set re=0 " fix redrawtime exceeded syntax highlighting disabled
set noshowmode
set incsearch
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
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>fl :Buffer<cr>
nnoremap <leader>fw :Rg<space>
nnoremap <leader>few :RgExactWord<space>
nnoremap <leader>* :RgCurrentWord<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bd :BD<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>fn :enew<cr>
nnoremap <leader>tn :set number!<cr>

imap <space> <plug>(PearTreeSpace)

inoremap <c-u> <esc>viwuea
inoremap <c-U> <esc>viwUea

" --- }}}


" auto-pairs custom settings --- {{{

let g:AutoPairsCenterLine=0

" --- }}}


" lightline custom settings --- {{{

let g:lightline = {
      \ 'colorscheme': 'onedark',
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


" pear-tree custom settings --- {{{

let g:pear_tree_repeatable_expand=0
let g:pear_tree_smart_openers=1
let g:pear_tree_smart_closers=1
let g:pear_tree_smart_backspace=1

" --- }}}


" fzf custom settings --- {{{

command! RgCurrentWord
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- ' . shellescape('\b' . expand('<cword>') . '\b'),
    \   1,
    \   fzf#vim#with_preview(),
    \   0
    \ )

command! -nargs=* RgExactWord
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- ' . shellescape('\b' . <q-args> . '\b'),
    \   1,
    \   fzf#vim#with_preview(),
    \   0
    \ )

function! RipgrepFzf(query)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:' . reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 0)
endfunction

" --- }}}


" vimscript filetype settings --- {{{

augroup filetype_vim
    autocmd!
    autocmd bufnewfile,bufread *.vimrc set filetype=vim
    autocmd bufnewfile,bufread *.vim set filetype=vim
    autocmd filetype vim :call <sid>VimCustomSettings()
augroup end

function! s:VimCustomSettings()
    setlocal foldmethod=marker
    setlocal shiftwidth=4
    setlocal softtabstop=4
endfunction

" --- }}}


" javascript (and its derivatives) filetype settings --- {{{

augroup filetype_js
    autocmd!
    autocmd filetype javascript,typescript,javascriptreact,typescriptreact :call <sid>JavascriptCustomSettings()
augroup end

function! s:JavascriptCustomSettings()
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
