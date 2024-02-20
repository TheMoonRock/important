:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set encoding=UTF-8

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/rafi/awesome-vim-colorschemes.git'
Plug 'https://github.com/ryanoasis/vim-devicons.git'
Plug 'https://github.com/tc50cal/vim-terminal.git'
Plug 'https://github.com/folke/todo-comments.nvim.git'

call plug#end()

source /home/artyom/.local/share/nvim/plugged/awesome-vim-colorschemes/colors/iceberg.vim

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


