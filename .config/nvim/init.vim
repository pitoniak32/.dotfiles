
" Set Statements
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nowrap

set hidden 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set noerrorbells
set termguicolors
set scrolloff=8
set updatetime=50
set colorcolumn=80
set signcolumn=yes

let mapleader=" "

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Telescope
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

call plug#end()

" LSP configuration 
lua require("lsp-config")

" Color Scheme
colorscheme gruvbox
highlight Normal guibg=none
filetype plugin on
syntax on

" Key Mappings
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>ff :GitFiles<CR>
