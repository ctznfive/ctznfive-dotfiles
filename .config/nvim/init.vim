call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()


syntax enable
"colorscheme peachpuff
set clipboard+=unnamedplus
set mouse=a
set expandtab
set tabstop=4
set shiftwidth=4
set nowrap
set number
set hlsearch
set incsearch
set ignorecase
set autoread
set smartcase
set backspace=2         " backspace in insert mode works like normal editor
filetype indent on      " activates indenting for files
set autoindent          " auto indenting
set splitright
set cursorline
hi CursorLineNr cterm=bold ctermbg=236
hi CursorLine cterm=NONE ctermbg=236
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=NONE
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=236
" Brackets Highlight
hi MatchParen cterm=none ctermbg=89
hi VertSplit ctermfg=Black ctermbg=DarkGray
hi LineNr ctermfg=darkgrey

let g:NERDTreeWinSize=25
let g:NERDTreeDirArrowExpandable = '•'
let g:NERDTreeDirArrowCollapsible = '☇'
map <C-n> :NERDTreeToggle<CR>

let g:lightline = {'colorscheme': 'wombat',}

hi SignColumn guibg=236 ctermbg=236
