" PLUG sound effect ~~~~~~~~~~~~~~

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'
Plug 'yuratomo/w3m.vim'


call plug#end()

" Config

set title
set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd

" Basic config

color tokyonight
syntax on
set encoding=utf-8
set number relativenumber

" sets tab completion
set wildmode=longest,list,full

"SCRIPTS ~~~~~~~~~~~~

"Goyo plugin config
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
			

