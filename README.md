# My terminal working environment setup

## Installation
### vim
- install `nvim`
- `alias vim='nvim'`
- make `nvim` use `.vimrc`: `cp ./init.vim ~/.config/nvim/`
- install vim-plug
- copy configuration files to the home dir by `./distribute_config_files.sh`
- `PlugInstall` to install all plugins`
    - everytime .vimrc gets updated, save the file then run `source %` before
      `PlugInstall`
- (optional) install bat and set BAT_THEME=OneHalfLight in shell config file 
    - for `fzf` and `ripprep`
- (optional) install ripgrep/silver searcher
- (optional) install markdown-preview.nvim 
    - which requires node, yarn and typescript
  installation 
    - also need to modify the ip
### tmux
- install TPM
- install configure vim-tmux-navigator on both vim and tmux sides

## Plugins used
### vim-plug
- preservim/nerdtree
- tpope/vim-commentary
- junegunn/fzf.vim
- numirias/semshi 
    - `pip3 install pynvim --upgrade`
- xolox/vim-session
- neoclide/coco.nvim 
    - requires nodejs ?= 12.12, recommand control node version
  with nvm: `omf install nvm`
- coc-pyright 
    - `CocInstall coc-pyright`
- dense-analysis/ale 
- christoomey/vim-tmux-navigator 
    - also requires tmux side setup
- iamcco/markdown-preview.nvim
- mhinz/vim-startify
- tiagofumo/vim-nerdtree-syntax-highlight
- ryanoasis/vim-devicons 
    - need nerd font to work
- ervandew/supertab
- github/copilot.vim
    - requires neovim >= 0.6
- preservim/tagbar
    - work with `ctags`
- ncm2/float-preview
    - show function def preview in floating window
- voldikss/vim-floaterm
- Yohannfra/Nvim-Switch-Buffer
### cmd tools
- ripgrep/silver searcher
- ctags 


## Workflow
## vim
- simple vim shortcuts
    - ctrl-d/u to scroll 1/4 page
- use `tab` to manage workspace
    - navigating between tabs `gt/gT`
- use `buffer` to manage opened files
    - use a buffer viz plugin 
- in a `tab`
    - use `split` to create different windows
    - use `Ranger` in each window to explore and open files
    - use `vim-floaterm` to open a floating terminal window for executing
      programs
        - `sp/vs terminal` to open the terminal in a split window
    - switch different buffers using buffer switcher ([github](https://github.com/Yohannfra/Nvim-Switch-Buffer))
    - `<leader>w` to write a file
- working with code
    - use `ctags` to tag a project for jumping to definitions
        - [introduction](https://www.thegeekstuff.com/2009/04/ctags-taglist-vi-vim-editor-as-sourece-code-browser/)
        - [some tricks/shortcuts](https://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks)
        - to exclude a path: `--exclude=path/\**`
    - use `tagbar` to preview structure of code, use <space> to see
        - <F1> to open an auto close tagbar, <F2> to toggle the tagbar (set up
          in .vimrc)
      prototype
- working with markdown
    - use `MarkdownPreviewToggle` to preview markdown
-


# FAQs
Q: getting some errors related to semshi \
A: `UpdateRemotePlugins` or `pip install --upgrade neovim` 

Q:\
A:

# To do
- split configuration into multiple files
- search/replace workflow
- sessions
- find all occurances of a variable
- cscope/pycscope
- floating window color
