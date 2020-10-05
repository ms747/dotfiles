set shell=/bin/bash
let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-unimpaired'
Plug 'aserebryakov/vim-todo-lists'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-expand-region'
Plug 'neovimhaskell/haskell-vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-line'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'alx741/vim-hindent'
Plug 'tpope/vim-surround'
Plug 'ziglang/zig.vim'
" Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-abolish'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

" Deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  set termguicolors
endif

" Colors
set background=dark
colorscheme base16-gruvbox-dark-hard
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" My Stuff
set nu
set cmdheight=1
set ignorecase
set smartcase
set relativenumber
set noswapfile

set undodir=~/.undodir
set undofile

" Home row setup
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A

" j
tnoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>
inoremap <C-j> <Esc>

" k
tnoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>
inoremap <C-k> <Esc>

" h
tnoremap <C-h> <Esc>
vnoremap <C-h> <Esc>
tnoremap <C-h> <Esc>
inoremap <C-h> <Esc>

" l
tnoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
tnoremap <C-l> <Esc>
inoremap <C-l> <Esc>
" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

set cmdheight=2
set updatetime=300

" Coc Settings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-.> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" LSP Config
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use wide tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set noexpandtab

" Wrapping options
set formatoptions=tc
set formatoptions+=r
set formatoptions+=q
set formatoptions+=n
set formatoptions+=b

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Magic
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/
set nohlsearch

" GUI settings
set guioptions-=T
set vb t_vb=
set backspace=2
set nofoldenable
set ttyfast
set lazyredraw
set synmaxcol=500
set laststatus=2
set number
set diffopt+=iwhite
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
" set colorcolumn=80
set showcmd
set mouse=a
set shortmess+=c
set cursorline
syntax on
filetype plugin indent on

" Show those damn hidden characters
set listchars=nbsp:¬,extends:»,precedes:«,trail:•


" Keyboard shortcuts
" nnoremap ; :
" nnoremap : ;

" Jump to start and end of line using the home row keys
map H ^
map L $

" Neat X clipboard integration
nnoremap <C-v> "+P
inoremap <C-v> <Esc>"+P
vnoremap <C-c> "+y

" Move by line
nnoremap j gj
nnoremap k gk

" Open hotkeys
map <C-p> :Locate<CR>
nmap <leader>; :Buffers<CR>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>


" Multi cursor
let g:multi_cursor_use_default_mapping=0

" Remove Trailing Spaces
autocmd BufWritePre * %s/\s\+$//e

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<C-j>'

" Move single line
nmap <A-k> [e
nmap <A-j> ]e

" Move multiple lines
vmap <A-k> [egv
vmap <A-j> ]egv

inoremap <A-space> <Esc>


set splitbelow splitright

" Expand Region
" map K <Plug>(expand_region_expand)
" map J <Plug>(expand_region_shrink)

let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :0,
      \ 'iB'  :0,
      \ 'il'  :1,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ 'ab'  :1,
      \ 'aB'  :1,
      \ 'i>'  :1,
      \ 'i)'  :1,
      \ }

" Duplicate lines
nmap <A-K> yykpj
nmap <A-J> yypk

nmap W b
vmap W b
nnoremap <c-x> <c-v>

" nvim colourizer
lua require'colorizer'.setup()

" ResT compatible tables
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" Custom Comment Colour
hi Comment guifg=#f5f542

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Haskell tab config
set expandtab ts=4 sw=4 ai

" Zig
let g:zig_fmt_autosave = 0

" Home End
nmap <C-a> 0
nmap <C-e> $

" Project Search
nnoremap \ :Rg!<CR>

let g:fzf_layout = { 'window'  : { 'width' : 0.9, 'height' : 0.9}}

nmap <leader>r :%s/

" Open File Manager
nmap <leader>o :Explore<CR>

" Custom file finder
command! -bang Locate call fzf#run(fzf#wrap({'source': 'fd --type f --hidden --exclude .git --exclude target'}))

" Fugitive
nnoremap <leader>g :Gstatus<CR>
