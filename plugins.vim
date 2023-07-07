" Install plugin if needed
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync
  \| endif

call plug#begin()
Plug 'sokinpui/vim-sandwich'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/vimux'
Plug 'junegunn/fzf.vim'
Plug 'preservim/vim-markdown', { 'for': 'markdown' }
Plug 'rhysd/clever-f.vim' 
Plug 'lambdalisue/fern.vim' 
Plug 'lambdalisue/fern-hijack.vim' 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

endif

"Plug 'fladson/vim-kitty'
"Plug 'godlygeek/tabular' 
"Plug 'lilydjwg/fcitx.vim' 
"Plug 'junegunn/vim-easy-align' 
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()

"   Sandwich
" single word
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

" visual
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

"   newtrw
let g:netrw_liststyle  = 3
let g:netrw_fastbrowse = 2

"nnoremap <leader><tab> :Explore<cr>
"nnoremap <leader><S-tab> :Texplore<cr>

"   markdown-preview
if has('mac')
    let g:mkdp_browser = 'safari' 
elseif has('linux')
    let g:mkdp_browser = 'chromium-browser'
endif
     
"   coc.nvim
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : 
      \ cocfunc#CheckBackspace() ? "\<TAB>" : coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

inoremap <silent><expr> <CR> coc#pum#visible() ? "\<C-g>u\<CR>\<c-r>=coc#pum#close()\<CR>" 
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <space> coc#pum#visible() ? "<C-r>=coc#pum#close()\<Cr>\<Space>"
                              \: "<space>"

" jump to next/previous error
nnoremap <silent> <LEADER>, <Plug>(coc-diagnostic-prev)
nnoremap <silent> <LEADER>. <Plug>(coc-diagnostic-next)

"   coc.snippets
inoremap <C-j> <Plug>(coc-snippets-expand-jump)
vnoremap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'

" coc rename variale
nnoremap <leader>rn <Plug>(coc-rename)
vnoremap <leader>rn <Plug>(coc-rename)

" run command in split window
nnoremap <leader>s :VimuxPromptCommand<CR>
nnoremap <leader><leader>s :VimuxCloseRunner<CR>
 
" vim-markdwon
let g:vim_markdown_folding_disabled        = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal_code_blocks     = 0
let g:vim_markdown_math                    = 1

" fzf.vim
let g:fzf_preview_window = ['right,50%', 'ctrl-/']
let g:fzf_layout         = {'window': { 'width': 0.9, 'height': 0.9 }}
let g:fzf_buffers_jump   = 1

nnoremap <leader>ff :Files<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fs :Lines<cr>
nnoremap <leader>fp :Rg<cr>
nnoremap <leader>f/ :History/<cr>
nnoremap <leader>f: :History:<cr>
nnoremap <leader>fh :Helptags<cr>

" next full digit
nnoremap <Leader>fd :set hlsearch<cr>/\d\+<cr>zz

" clever-f
let g:clever_f_smart_case              = 1
let g:clever_f_across_no_line          = 0
let g:clever_f_chars_match_any_signs   = ';'
let g:clever_f_repeat_last_char_inputs = [ "\<TAB>" ]

" fern file explorer
let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '

let g:fern#disable_default_mappings   = 1
let g:fern#disable_drawer_auto_quit   = 0
let g:fern#disable_viewer_hide_cursor = 1

nnoremap <leader><tab>   :Fern . -drawer -reveal=% -width=35 -toggle<CR><C-w>=
"noremap  <Leader><S-tab> :Fern . -drawer -reveal=% -width=35<CR><C-w>=

"autocmd insertenter * execute "FernDo close"

" vim-visual-mutli, mulit cursor
let g:VM_quit_after_leaving_insert_mode = 1
let g:VM_highlight_matches = 'red'
let g:VM_highlight_matches = 'hi! Search ctermfg=228 cterm=underline'

let g:VM_leader = '<space>'
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<leader>n'  
let g:VM_maps['Find Subword Under']         = '<leader>n'  
let g:VM_custom_remaps = {'s': 'c'}
