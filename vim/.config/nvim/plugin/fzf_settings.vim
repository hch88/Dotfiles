if exists('g:loaded_fzf_settings')
  finish
endif
let g:loaded_fzf_settings = 1

if has("nvim")
  augroup FZF_ESC_BEHAVIOR
    autocmd!
    autocmd TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    autocmd FileType fzf tunmap <buffer> <Esc>
  augroup END
endif

let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1 } }  

command! -bang VimFiles call fzf#vim#files('~/.config/nvim', <bang>0)

" Mappings
nnoremap ,F <cmd>GitFiles<CR>
nnoremap ,b <cmd>Buffers<CR>
nnoremap ,rf <cmd>History<CR>
nnoremap ,v <cmd>VimFiles<CR>
nnoremap ,h <cmd>Helptags<CR>
nnoremap ,rg <cmd>Rg<CR>

" LSP Mappings
nnoremap ,ld <cmd>Diagnostics<cr>
nnoremap ,lr <cmd>References<cr>
nnoremap ,li <cmd>Implementations<cr>
nnoremap ,@ <cmd>DocumentSymbols<cr>
