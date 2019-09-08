set number " show the line number
set relativenumber " show relative line numbers
set smartindent
set showcmd " show mode

set cursorline " highlight the current line

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set splitbelow " splitting a window will put it below
set splitright " splitting a window will put it right

set foldlevel=999 " start with all folds expanded

set ruler " show row/column
set scrolloff=1 " always show one line below/above your cursor

set mouse=a " mouse support

set termguicolors

set undofile

set inccommand=nosplit " live preview for replace

" vim-plug
call plug#begin('~/.config/nvim/plugs')

Plug 'flazz/vim-colorschemes' " colorschemes
Plug 'scrooloose/nerdtree' " sidebar tree
Plug 'Xuyuanp/nerdtree-git-plugin' " sidebar tree git support
Plug 'neomake/neomake' " code checkers for many languages
Plug 'vim-airline/vim-airline' " pretty status bar
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

" language support
Plug 'yanqd0/nginx.vim' " nginx conf
Plug 'wlangstroth/vim-racket' " racket
Plug 'arrufat/vala.vim' " vala
Plug 'igankevich/mesonic' " meson
Plug 'leafgarland/typescript-vim' " typescript
Plug 'cespare/vim-toml' " toml

" erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'

" autocompletion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'poppyschmo/deoplete-latex'
" Plug 'Shougo/neco-vim'

call plug#end()

colorscheme Tomorrow-Night-Eighties
highlight Comment cterm=italic

nmap <Leader>; :Buffers<CR>
nmap <Leader>t :Files<CR>

" open nerdtree on start
autocmd vimenter * NERDTree 
" jump to main window
autocmd VimEnter * wincmd p
" close nerdtree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" run neomake on write
autocmd! BufWritePost * Neomake

" use unicode symbols for airline
let g:airline_powerline_fonts = 1

" enable deoplete autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

let g:gitgutter_realtime = 0
