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
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-fugitive'
Plug 'mattboehm/vim-unstack'
Plug 'Houl/repmo-vim'
" for vim in tmux to copy/paste between others
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'vim-scripts/taglist.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }



" All of your Plugins must be added before the following line
"
call plug#end()            " required

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
nnoremap j gj
nnoremap k gk

set cursorline
set cursorcolumn
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

"按F5运行python"
"map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
"function RunPython()
"    let mp = &makeprg
"    let ef = &errorformat
"    let exeFile = expand("%:t")
"    setlocal makeprg=python\ -u
"    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"    silent make %
"    copen
"    let &makeprg = mp
"    let &errorformat = ef
"endfunction

"作者：yiekue
"链接：https://www.jianshu.com/p/f0513d18742a
"來源：简书
"著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
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
" set statusline+=%{FugitiveStatusline()}

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
" clipboard settings here !
""""""""""""""""""""""""""""""""
set clipboard+=unnamed

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
:noremap <expr> j repmo#Key('gj', 'gk')|sunmap j
:noremap <expr> k repmo#Key('gk', 'gj')|sunmap k

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

""""""""
" for syntastic checker
""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_quiet_messages = { "type": "style" }

""""""""""""""""""""""
" jedi-vim config
"""""""""""""""""""""""
let g:jedi#smart_auto_mappings = 0

""""""""""""""""""""""
" ctlrp.vim config
"""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

""""""""""
" vim-easy-align config
""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""
" deoplete
"""""
let g:deoplete#enable_at_startup = 1
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
