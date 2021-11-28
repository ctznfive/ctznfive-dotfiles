" plugins:
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ferrine/md-img-paste.vim'
"Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'lervag/vimtex'
Plug 'vim-scripts/vim-auto-save'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

"highlights the background for text that goes over the 80 column limit 
"highlight OverLength ctermbg=grey ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

syntax enable
let g:asmsyntax = 'nasm'
set clipboard=unnamedplus
"hi Normal     ctermbg=black
hi SignColumn guibg=black ctermbg=black
"set encoding=UTF-8
"let g:auto_save = 1  " enable AutoSave on Vim startup
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
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
let g:netrw_liststyle = 3
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
let g:markdown_folding = 1
set nofoldenable
set foldcolumn=2
highlight Folded ctermbg = NONE
highlight FoldColumn ctermbg = NONE
highlight SignColumn ctermbg = NONE
autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
let &t_SI="\<Esc>[6 q"
"let &t_SR="\<Esc>[4 q"
let &t_EI="\<Esc>[2 q"
" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
set fillchars+=vert:\ 
hi VertSplit ctermfg=Black ctermbg=DarkGray
imap <F4> <Esc>:browse tabnew<CR>
map <F4> pEsc>:browse tabnew<CR>
imap <F5> <Esc> :tabprev <CR>i
map <F5> :tabprev <CR>
imap <F6> <Esc> :tabnext <CR>i
map <F6> :tabnext <CR>
let g:tagbar_width=35
highlight TagbarFoldIcon ctermfg=Black
nmap <F10> :TagbarToggle<CR>
autocmd FileType python,c,cpp,java,go TagbarOpen
set pastetoggle=<F3>
let g:NERDTreeWinSize=25
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set laststatus=2
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
hi StatusLine ctermbg=black ctermfg=black
set wildmenu
set wcm=<Tab>
" spell checking:
menu SetSpell.ru :set spl=ru spell<CR>
menu SetSpell.en :set spl=en spell<CR>
menu SetSpell.off :set nospell<CR>
map <F7> :emenu SetSpell.<Tab>
" alternatives:
imap <F8> <Esc> z=<CR>i
map <F8> z=<CR>
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20
let g:NERDTreeDirArrowExpandable = '•'
let g:NERDTreeDirArrowCollapsible = '☇'
" let g:mapleader=','
map <Leader> <Plug>(easymotion-prefix)
map <C-f> :Files<CR>
set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
highlight Pmenu ctermfg=black ctermbg=246
highlight PmenuSel ctermfg=246 ctermbg=black
highlight YcmErrorSign ctermfg=red ctermbg=NONE
highlight YcmErrorSection ctermfg=black ctermbg=red
