return {
  {
    "machakann/vim-sandwich",
    --event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.cmd([[
      let g:sandwich_no_default_key_mappings = 1

      silent! nmap <unique> gs <Plug>(sandwich-add)
      silent! xmap <unique> gs <Plug>(sandwich-add)
      silent! omap <unique> gs <Plug>(sandwich-add)

      silent! xmap <unique> ds <Plug>(sandwich-delete)
      silent! nmap <unique> ds <Plug>(sandwich-delete-auto)

      silent! xmap <unique> cs <Plug>(sandwich-replace)
      silent! nmap <unique> cs <Plug>(sandwich-replace-auto)

      " single word
      nmap <leader>( gsiw(E
      nmap <leader>) gsiw)E
      nmap <leader>[ gsiw[E
      nmap <leader>] gsiw]E
      nmap <leader>{ gsiw{E
      nmap <leader>} gsiw}E
      nmap <leader>" gsiw"E
      nmap <leader>' gsiw'E
      nmap <leader>< gsiw<E
      nmap <leader>> gsiw>E
      nmap <leader>` gsiw`E
      nmap <leader>$ gsiw$E
      nmap <leader>* gsiw*.E
      nmap <leader>~ gsiw~.E
      "nmap <leader><space> gsiw<space>

      " visual
      vmap <leader>( gs(
      vmap <leader>) gs)
      vmap <leader>[ gs[
      vmap <leader>] gs]
      vmap <leader>{ gs{
      vmap <leader>} gs}
      vmap <leader>" gs"
      vmap <leader>' gs'
      vmap <leader>< gs<
      vmap <leader>> gs>
      vmap <leader>` gs`
      vmap <leader>$ gs$
      vmap <leader>_ gs_
      vmap <leader>* gs*.
      vmap <leader>~ gs~.
      vmap <leader><space> gs<space>
      ]])
    end
  },
}
