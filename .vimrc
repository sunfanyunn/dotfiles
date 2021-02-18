" https://stackoverflow.com/questions/14697797/cant-get-bundleinstall-working-for-vundle/22398235#22398235
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

""""""""""""""""""""""
" This is for Vundle "
""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'

Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'


Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leomao/pikacode.vim'
Plugin 'vim-scripts/repmo.vim'

Plugin 'davidhalter/jedi-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""
" Put your non-Plugin stuff after this line "
"""""""""""""""""""""""""""""""""""""""""""""

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting.
" This enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" move vertically by visual line
"nnoremap j gj
"nnoremap k gk

set number
set nocompatible
set hlsearch
set ruler
" set cursorline
set background=dark
set showmode
set showmatch
" enable backspace to work
set backspace=2
" tab --> spaces
set expandtab
" control how many columns text is indented with the reindent operations (<<
" and >>)
set shiftwidth=2
set tabstop=2
set softtabstop=2
" Is I use smartindent, autoindent should be set
set autoindent
set smartindent

set colorcolumn=81,101
" Or I could map <F2> to :set paste!  set pastetoggle=<F2>
set pastetoggle=<F2>

nmap co :%y+<CR>
nmap <bslash>x mzHmx:silent! :%s/[ \t][ \t]*$//g<CR>`xzt`z
imap jj <Esc>

autocmd FileType c nmap <F9> <ESC>\x:w<CR>:!gcc -O2 -Wall -std=c99 % -o %<<CR>
autocmd FileType c nmap <F11> <ESC>\x:w<CR>:!./%<<CR>
autocmd FileType c nmap <F12> <ESC>\x:w<CR>:!gcc -O2 -Wall -std=c99 % -o %< && ./%<<CR>
autocmd FileType c imap <F9> <ESC>\x:w<CR>:!gcc -O2 -Wall -std=c99 % -o %<<CR>
autocmd FileType c imap <F11> <ESC>\x:w<CR>:!./%<<CR>
autocmd FileType c imap <F12> <ESC>\x:w<CR>:!gcc -O2 -Wall -std=c99 % -o %< && ./%<<CR>

"autocmd Filetype c nmap <C-S-c> 0i//<Esc>
"autocmd Filetype c imap <C-S-c> jj<C-S-c>
"autocmd Filetype c nmap <C-S-x> 0xx
"autocmd Filetype c imap <C-S-x> jj<C-S-x>

autocmd FileType cpp nmap ff :!time ./%<
autocmd FileType cpp nmap <F5>  :!time ./%<<CR>
autocmd FileType cpp nmap <F6>  :!time ./%<  < in<CR>
autocmd FileType cpp nmap <F9> <ESC>\x:w<CR>:!g++ -O3 -D DEBUG -g -std=c++14 -Wall -Wextra -Wshadow -Wno-unused-result % -o %<<CR>
autocmd FileType cpp nmap <F12> <ESC>\x:w<CR>:!g++ -O3 -D DEBUG -g -std=c++14 -Wall -Wextra -Wshadow -Wno-unused-result % -o %< && time ./%<<CR>

autocmd FileType cpp imap <F9> <ESC>\x:w<CR>:!g++ -O3 -D DEBUG -g -std=c++14 -Wall -Wextra -Wshadow -Wno-unused-result % -o %<<CR>
autocmd FileType cpp imap <F12> <ESC>\x:w<CR>:!g++ -O3 -D DEBUG -g -std=c++14 -Wall -Wextra -Wshadow -Wno-unused-result % -o %< && time ./%<<CR>

"autocmd Filetype cpp nmap <C-S-c> 0i//<Esc>
"autocmd Filetype cpp imap <C-S-c> jj<C-S-c>
"autocmd Filetype cpp nmap <C-S-x> 0xx
"autocmd Filetype cpp imap <C-S-x> jj<C-S-x>

autocmd FileType python nmap <F11> <ESC>\x:w<CR>:!python3 %<CR>
autocmd FileType python nmap <F12> <ESC>\x:w<CR>:!python3 %<CR>
autocmd FileType python imap <F11> <ESC>\x:w<CR>:!python3 %<CR>
autocmd FileType python imap <F12> <ESC>\x:w<CR>:!python3 %<CR>

"autocmd Filetype python nmap <C-S-c> 0i#<Esc>
"autocmd Filetype python imap <C-S-c> <Esc><C-S-c>
"autocmd Filetype python nmap <C-S-x> 0x
"autocmd Filetype python imap <C-S-x> <Esc><C-S-x>

autocmd FileType tex nmap <F10> <ESC>\x:w<CR>:!gnome-open %<.pdf<CR><CR>
autocmd FileType tex nmap <F12> <ESC>\x:w<CR>:!xelatex %<CR>
autocmd FileType tex imap <F10> <ESC>\x:w<CR>:!gnome-open %<.pdf<CR><CR>
autocmd FileType tex imap <F12> <ESC>\x:w<CR>:!xelatex %<CR>

autocmd Filetype tex nmap <C-S-c> 0i%<Esc>
autocmd Filetype tex imap <C-S-c> jj<C-S-c>
autocmd Filetype tex nmap <C-S-x> 0x
autocmd Filetype tex imap <C-S-x> jj<C-S-x>

"autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
"autocmd Filetype js setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make set noexpandtab

" fold by indent level
set fdm=indent
set foldlevel=0
set foldnestmax=2
set foldminlines=1

" Use the plugin powerline to replace this
" set the following line to show statusline always
" set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR><F2>

" to move between tabs
nnoremap tn :tabnext<CR>
nnoremap tN :tabprev<CR>

""""""""""""""""""""""""""""""""
" A very important settings here!
""""""""""""""""""""""""""""""""
set clipboard=unnamed

"""""""""""""""""""""""""""""
" vim-airline setting
""""""""""""""""""""""""""""""
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_buffers = 1
set t_Co=256

""""""""""""""""""""""""""""""
" NERDTree setting
""""""""""""""""""""""""""""""
nmap <leader>t :NERDTreeToggle<CR>
" let NERDTreeWinSize = 23

""""""""""""""""""""""""""""""
" https://github.com/Houl/repmo-vim
""""""""""""""""""""""""""""""
" This plugin is not under bundle, put repmo.vim under .vim/plugin

" map a motion and its reverse motion:
:noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
:noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

" if you like `:noremap j gj', you can keep that:
":noremap <expr> j repmo#Key('gj', 'gk')|sunmap j
":noremap <expr> k repmo#Key('gk', 'gj')|sunmap k

" repeat the last [count]motion or the last zap-key:
:map <expr> ; repmo#LastKey(';')|sunmap ;
:map <expr> , repmo#LastRevKey(',')|sunmap ,

" add these mappings when repeating with `;' or `,':
:noremap <expr> f repmo#ZapKey('f')|sunmap f
:noremap <expr> F repmo#ZapKey('F')|sunmap F
:noremap <expr> t repmo#ZapKey('t')|sunmap t
:noremap <expr> T repmo#ZapKey('T')|sunmap T
""""""""""""""""""""""""""""""
" nerdcommenter
""""""""""""""""""""""""""""""
let g:NERDCreateDefaultMappings = 0
nmap <C-c> <plug>NERDCommenterToggle
vmap <C-c> <plug>NERDCommenterToggle gv

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}
" => Colors, Fonts, Encoding {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on " Enable syntax highlight
set background=dark
colorscheme pikacode
" Set font according to system
if has('gui_running')
  if has('win32') || has('win64')
    set gfn=Consolas:h16
  else
    set gfn=Monospace\ 16
  endif
endif
set fileencodings=utf8
set encoding=utf8
" format options
set fo+=Mm " for multi btye character
set fo+=crql
set fo-=t
set ffs=unix,dos,mac " Default file types

" copy to buffer
vmap <C-b> :w! ~/.vimbuffer<CR>
nmap <C-b> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-m> :r ~/.vimbuffer<CR>
