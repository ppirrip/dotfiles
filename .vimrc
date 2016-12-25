" https://github.com/sdiehl/haskell-vim-proto
" Each of the sections can be copied into your existing config independent of
" the other ones.

" == basic ==
syntax on
filetype plugin indent on

" == force to use bash ==
set shell=bash

set nocompatible
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

" for 256 colors
set t_Co=256

" use solarize theme
set background=dark
"colorscheme solarized
"colorscheme molokai
colorscheme wombat 

set cmdheight=1
" ==
" == Plugin configuration: Haskell ==
" ==

" == mapping for ghc-mod ==
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" == config supertab to compliment necoghc ==
" <c-x><c-o> trigger necoghc if supertab is not used
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
au FileType haskell setlocal omnifunc=necoghc#omnifunc

" == Compliation and Testing ==
" note: vim 8.0 is need for asyncrun.vim
au FileType haskell compiler ghc
au FileType haskell setlocal makeprg=stack
au FileType haskell nnoremap <buffer> gj :write<CR> :exec "AsyncRun " . &makeprg . " build"<CR>
au FileType haskell nnoremap <buffer> gk :write<CR> :exec "AsyncRun " . &makeprg . " test"<CR>

" == ghci integration ==
" Note: this need to run vim inside tmux e.g. tmux vim
function! RunGhci(type)
    call VimuxRunCommand(" stack ghci && exit")
    if a:type
        call VimuxSendText(":l " . bufname("%"))
        call VimuxSendKeys("Enter")
    endif
endfunction

au FileType haskell nmap <silent><buffer> <leader>gg :call RunGhci(1)<CR>
au FileType haskell nmap <silent><buffer> <leader>gs :call RunGhci(0)<CR>

" === vim airline ===
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

set laststatus=2

" == for Pathogen ==
execute pathogen#infect()
