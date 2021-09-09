set ttymouse=xterm2
set mouse=a
set number
set relativenumber
syntax on
colorscheme codedark
"Hide intro
set shortmess=I

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0
"Don't change tmux theme always
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='peaksea'

"EOF tilde character color
highlight EndOfBuffer ctermfg=black

nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeToggle<CR>
let NERDTreeWinPos=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
          \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
          \ | setlocal concealcursor=n
augroup end

set fillchars+=vert:\│
highlight VertSplit cterm=NONE ctermfg=darkgrey ctermbg=NONE
highlight StatusLine ctermfg=235
highlight StatusLineNC ctermfg=235

set cursorline
highlight CursorLine term=bold cterm=NONE ctermbg=NONE  ctermfg=NONE gui=bold
highlight CursorLineNr term=bold cterm=NONE ctermbg=NONE ctermfg=yellow gui=bold

let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

