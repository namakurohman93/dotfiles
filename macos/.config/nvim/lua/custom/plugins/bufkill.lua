return {
  'qpkorr/vim-bufkill',
  init = function()
    vim.cmd [[
      let g:BufKillCreateMappings = 0
    ]]
  end,
}
