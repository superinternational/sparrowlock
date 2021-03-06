set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/short/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/short/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'sjl/badwolf'

Plug 'junegunn/vim-peekaboo'
Plug 'autoswap.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-fugitive'
Plug 'LaTeX-Box-Team/LaTeX-Box'
"Plug 'tpope/vim-liquid'
Plug 'matchit.zip'
Plug 'haya14busa/incsearch.vim'
"Plug 'godlygeek/tabular'
Plug 'kopischke/vim-fetch'
"Plug 'Shougo/deoplete.nvim'
"Plug 'vim-scripts/diffchar.vim'
call plug#end()

filetype plugin indent on

syntax on                         " Turn on syntax highlighting
set encoding=utf-8                " UTF-8 encoding
set showcmd                       " Displays command in last line
set showmode                      " Displays mode in last line
set wildmenu                      " Displays tab completion above status line
set wildmode=longest:full,full    " Always show wildmenu
set cursorline                    " Highlight current line
set modelines=0                   " Disable modelines
set ttyfast                       " Faster redrawing in terminal
set visualbell                    " Visual bell instead of beeping
set background=dark

" -- Backup/Swap etc.
set undofile                      " Use undo-file features
set backupdir=~/.vtmp/b//,/tmp//  " Backup directory
set dir=~/.vtmp/s//,/tmp//        " Swap directory
set undodir=~/.vtmp/u//,/tmp//    " Undo directory

" -- Searching
set incsearch                     " Incremental search
set hlsearch                      " Highlight search words
set ignorecase                    " Search is case-insensitive ...
set smartcase                     " ... unless it contains a capital letter

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" -- Spell checking
set spelllang=en_us,de
set spellfile=~/.vim/spell/fwalch.utf-8.add

" -- Completion
set completeopt=menuone,preview   " Show completion menu even if only one match

" -- Side-/Statusbar
set ruler                         " Show current position in status bar
set laststatus=2                  " Always display status line
set noshowmode                    " Hide mode text below status line
set relativenumber                " Show relative line numbers
set number                        " ... but show absolute on current line

" -- Window management
set splitright                    " Create vertical splits on the right

" -- Indentation and tab handling
set tabstop=2                     " 2 spaces equal one tab
set shiftwidth=0                  " Use tabstop for auto-indentation
set softtabstop=-1                " Use shiftwidth
set expandtab                     " Use spaces instead of tabs
set backspace=indent,eol,start    " Backspacing over everything

if has('linebreak')
  set breakindent
endif

" -- Show invisible characters
set list
set listchars=tab:»\ ,trail:␣,extends:↲,precedes:↳,nbsp:·

" +--------------+
" | Key mappings |
" +--------------+

let mapleader = "ö"

nnoremap <F5> :make!<CR>
nnoremap <F6> :exec 'read !'.getline('.')<CR>
" Execute visual selection in split terminal
vnoremap <F6> y<c-w>wpA<cr><c-\><c-n><c-w>pgv

" Map CTRL-J and CTRL-K to move through completion
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" Map ESC ESC to exit terminal mode
if has('nvim')
  tnoremap <esc><esc> <C-\><C-n>
endif

" +----------------+
" | Theme settings |
" +----------------+

if &term == 'linux'
  silent! colorscheme darkblue
else
  silent! colorscheme badwolf
  highlight default link SneakPluginTarget EasyMotionTarget
  highlight default link SneakPluginScope EasyMotionShade
endif

highlight default SyntasticError ctermbg=196 guibg=#ff2c4b ctermfg=15 guifg=#f9f6f2 cterm=bold term=bold gui=bold
highlight default SyntasticWarning ctermbg=214 guibg=#ffa724 ctermfg=15 guifg=#f9f6f2 cterm=bold term=bold gui=bold

highlight CursorLine term=bold cterm=bold gui=bold

" +-----------------+
" | CTRL-P settings |
" +-----------------+

let g:ctrlp_custom_ignore = '\.class$\|\vendor/bundle$|\tmp$|\.o$'
let g:ctrlp_by_filename = 1 " Search only filename by default
let g:ctrlp_working_path_mode = 'rwa'

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" +--------------------+
" | Syntastic settings |
" +--------------------+

let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 0

let g:syntastic_tex_checkers = ['chktex', 'lacheck']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_cpp_compiler_options = '-std=c++11'

" +------------------------+
" | YouCompleteMe settings |
" +------------------------+

let g:ycm_confirm_extra_conf = 0         " Don't ask when opening ycm config file
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" +--------------------+
" | incsearch settings |
" +--------------------+

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
let g:incsearch#consistent_n_direction = 1
augroup incsearch-keymap
  autocmd!
  autocmd VimEnter * call s:incsearch_keymap()
augroup END
function! s:incsearch_keymap()
  IncSearchNoreMap <C-J> <Over>(incsearch-next)
  IncSearchNoreMap <C-K> <Over>(incsearch-prev)
  IncSearchNoreMap <C-U> <Over>(incsearch-scroll-f)
  IncSearchNoreMap <C-D> <Over>(incsearch-scroll-b)
endfunction

" +-------------------+
" | Other settings |
" +-------------------+

let delimitMate_expand_cr = 1
let g:easytags_suppress_report = 1
let g:deoplete#enable_at_startup = 1

" Source local extra config file if it exists
" let s:extra_config = getcwd() .'/.vim_extra_conf.vim'
" if filereadable(s:extra_config)
"   execute 'source'. s:extra_config
" endif
