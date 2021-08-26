# My terminal working environment setup

## Installation
### vim
- install `nvim
- `alias vim='nvim'`
- make nvim use `.vimrc`: in vim `:help nvim-from-vim`
- install vim-plug
- copy configuration files to the home dir
- `PlugInstall` to install all plugins`
- (optional) install bat and set BAT_THEME=OneHalfLight in shell config file (for fzf ripprep)
- (optional) install ripgrep/silver searcher
- (optional) install markdown-preview.nvim (which requires node, yarn and typescript
  installation)
### tmux
- install TPM
- install configure vim-tmux-navigator on both vim and tmux sides

## Plugins used
### vim-plug
- preservim/nerdtree
- tpope/vim-commentary
- junegunn/fzf.vim
- numirias/semshi (`pip3 install pynvim --upgrade`)
- xolox/vim-session
- neoclide/coco.nvim
- coc-python (`CocInstall coc-python`)
- dense-analysis/ale 
- christoomey/vim-tmux-navigator (also requires tmux side setup)
- iamcco/markdown-preview.nvim
### others
- ripgrep/silver searcher

# To do
- split configuration into multiple files
