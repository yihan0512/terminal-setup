" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'mhinz/vim-startify'

" ranger.vim
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" nerdtree
" Plug 'preservim/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons'

" vim-session
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'

" ALE
Plug 'dense-analysis/ale'

" numirias/semshi
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" jedi-vim
" Plug 'davidhalter/jedi-vim'


" tmux vim navigation
Plug 'christoomey/vim-tmux-navigator'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" indentLine
Plug 'Yggdroot/indentLine'




" Initialize plugin system
call plug#end()

    
" jedi-vim settings
let g:jedi#completions_command = "<C-N>"

" color
colorscheme delek

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
" set wrap
set textwidth=79
set formatoptions=tcqrn1
set formatoptions-=t
set formatoptions-=r
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
"set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized

" mouse mode on
set mouse=a
" """ nerdtree configuration

" " Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"      \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" " Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" " Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror| endif


" " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" " Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" " Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" " startify
" " workaround of nerdtree startup issue
" let g:startify_session_before_save = [
"             \ 'silent! NERDTreeClose'
"             \ ]
" autocmd SessionLoadpost * NERDTree
" " let startify read nerdtree bookmarks
" let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")



""" fold configuration
au BufNewFile,BufRead *.py set foldmethod=indent 
nnoremap <space> za

"""" ALE config
" specify linters
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

" specify fixers
let g:ale_fixers = {
      \    'python': ['autopep8', 'yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" show warnings and errors
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

""" fzf configuration
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

""" vim-session
" Disable all session locking - I know what I'm doing :-).
let g:session_lock_enabled = 0

" markdown-preview
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = '172.16.60.140' " change to you vps or vm ip
let g:mkdp_port = 8080
function! g:EchoUrl(url)
    :echo a:url
endfunction
let g:mkdp_browserfunc = 'g:EchoUrl'

""" vim-devicons
" set guifont=FiraCode\ Nerd\ Font:h11

""" coc-python
" use <cr> to confirm an completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


""" supertab
" tab completion in top down order
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

""" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

