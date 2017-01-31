filetype on
syntax on
colorscheme Tomorrow-Night
set t_Co=256
set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set cursorline
filetype indent on
set wildmenu
set showmatch
set incsearch  " search as character are entered
set hlsearch

" su-write
command W w !sudo tee % > /dev/null

" remap leader to space
let mapleader="\<Space>"

nnoremap j gj  " move vertically by visual line
nnoremap k gk
nnoremap <leader><Esc> :nohlsearch<CR>

nnoremap gV `[v`] " highlight last inserted text

" enable TMUX vertical cursor

if exists('$TMUX')
    let &t_SI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI="\<Esc>]50;CursorShape=1\x7"
    let &t_EI="\<Esc>]50;CursorShape=0\x7"
endif

" column width
highlight ColorColumn ctermbg=darkred ctermfg=white guibg=#592929
match ColorColumn /\%81v.\+/

" powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
