set exrc
set secure

" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" git wrapper
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" tree explorer
Plugin 'scrooloose/nerdtree'

" bottom bar
Plugin 'lokaltog/vim-powerline'

" file searching
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'

Plugin 'vim-syntastic/syntastic'

Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'

Plugin 'elzr/vim-json'

" shakespear highlighting
Plugin 'pbrisbin/vim-syntax-shakespeare'

" solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" white space {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " for autoindent
set autoindent
set smartindent
set textwidth=79
" }}}

" looks {{{
set number              " show line numbers
set visualbell          " blink instead of beeping
set showcmd             " show command in bottom bar
set showmode
set colorcolumn=80     " highlight column 80
highlight ColorColumn ctermbg=darkgrey
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
syntax on               " enable syntax processing
set laststatus=2        " status bar
set showtabline=2       " always show tabs
set background=dark

try
  colorscheme solarized
catch /.*/
  colorscheme peachpuff
endtry

" }}}

" cursor motion {{{
set backspace=indent,eol,start
set matchpairs+=<:>             " use % to jump between pairs
" }}}

" searching {{{
set incsearch                               " search as characters are entered
set hlsearch                                " highlight matches
set ignorecase                              " search ignores case
set smartcase                               " unless you search caps
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " ignore useless shit
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
" :help foldmethod to learn more
set modelines=1
" }}}

" keybinds {{{
" Set f5 to clear trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <leader><space> :nohlsearch<CR>    " turn off search highlight
nnoremap <space> za     " space open/closes folds
nnoremap gV `[v`]       " highlight last inserted text
nnoremap ∆ :m.+1<CR>==
nnoremap ˚ :m.-2<CR>==
inoremap ∆ <Esc>:m.+1<CR>==gi
inoremap ˚ <Esc>:m.-2<CR>==gi
vnoremap ∆ :m'>+1<CR>gv=gv
vnoremap ˚ :m'<-2<CR>gv=gv
" }}}

" ctrlp {{{
let g:ctrlp_working_path_mode = 'ra'        " search at project root folder
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" }}}

" ack {{{
nnoremap <leader>a :Ack!<space>
nnoremap <leader>l :LAck!<CR>
" }}}

" syntastic {{{
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" }}}

" NERDTree git flags {{{
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" }}}

set exrc
