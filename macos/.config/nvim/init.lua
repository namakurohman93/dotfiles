require('didadadida93')

vim.cmd([[
augroup global_settings
autocmd filetype * setlocal formatoptions-=cro
augroup end

autocmd User TelescopePreviewerLoaded setlocal number

let g:BufKillCreateMappings = 0
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg=#ff007c gui=bold ctermfg=198 cterm=bold
highlight QuickScopeSecondary guifg=#00dfff gui=bold ctermfg=45 cterm=bold
]])
