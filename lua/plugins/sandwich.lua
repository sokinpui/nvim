return {
    {
        "machakann/vim-sandwich",
        config = function()
            vim.g.sandwich_no_default_key_mappings = 1
            vim.cmd([[
            silent! nmap <unique> cc <Plug>(sandwich-add)
            silent! xmap <unique> cc <Plug>(sandwich-add)
            silent! omap <unique> cc <Plug>(sandwich-add)
            silent! xmap <unique> ds <Plug>(sandwich-delete)
            silent! nmap <unique> ds <Plug>(sandwich-delete-auto)
            silent! xmap <unique> cs <Plug>(sandwich-replace)
            silent! nmap <unique> cs <Plug>(sandwich-replace-auto)

            omap is <Plug>(textobj-sandwich-auto-i)
            xmap is <Plug>(textobj-sandwich-auto-i)
            omap as <Plug>(textobj-sandwich-auto-a)
            xmap as <Plug>(textobj-sandwich-auto-a)

            nmap <leader>( cciw(E
            nmap <leader>) cciw)E
            nmap <leader>[ cciw[E
            nmap <leader>] cciw]E
            nmap <leader>{ cciw{E
            nmap <leader>} cciw}E
            nmap <leader>" cciw"E
            nmap <leader>' cciw'E
            nmap <leader>< cciw<E
            nmap <leader>> cciw>E
            nmap <leader>` cciw`E
            nmap <leader>$ cciw$E
            nmap <leader>* cciw*.E
            nmap <leader>~ cciw~.E
            "nmap <leader><space> cciw<space>

            vmap <leader>( cc(
            vmap <leader>) cc)
            vmap <leader>[ cc[
            vmap <leader>] cc]
            vmap <leader>{ cc{
                vmap <leader>} cc}
                vmap <leader>" cc"
                vmap <leader>' cc'
                vmap <leader>< cc<
                vmap <leader>> cc>
                vmap <leader>` cc`
                vmap <leader>$ cc$
                vmap <leader>_ cc_
                vmap <leader>* cc*.
                vmap <leader>~ cc~.
                vmap <leader><space> cc<space>
                ]])
            end,
        },
    }
