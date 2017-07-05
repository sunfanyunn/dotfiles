
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

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
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
source /etc/vim/vimrc.local
endif
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set number
set nocompatible
set hlsearch
set ruler
"#set cursorline
set background=dark
set showmode
set showmatch

set expandtab
set backspace=2
set shiftwidth=4
set tabstop=4
set softtabstop=4

set autoindent
set smartindent

autocmd FileType python set tw=80 cc=0
autocmd FileType make set noexpandtab

set pastetoggle=<F2>

nmap co :%y+<CR>

nmap <bslash>p :set paste!<CR>
nmap <bslash>x mzHmx:silent! :%s/[ \t][ \t]*$//g<CR>`xzt`z
nmap <bslash>t :Tlist<CR>
imap jj <Esc>

autocmd FileType c nmap <F9> <ESC>\x:w<CR>:!gcc -O2 -Wall -std=c99 % -o %<<CR>
autocmd FileType c nmap <F11> <ESC>\x:w<CR>:!./%<<CR>
autocmd FileType c nmap <F12> <ESC>\x:w<CR>:!gcc -O2 -Wall -std=c99 % -o %< && ./%<<CR>
autocmd FileType c imap <F9> <ESC>\x:w<CR>:!gcc -O2 -Wall -std=c99 % -o %<<CR>
autocmd FileType c imap <F11> <ESC>\x:w<CR>:!./%<<CR>
autocmd FileType c imap <F12> <ESC>\x:w<CR>:!gcc -O2 -Wall -std=c99 % -o %< && ./%<<CR>

autocmd Filetype c nmap <C-S-c> 0i//<Esc>
autocmd Filetype c imap <C-S-c> jj<C-S-c>
autocmd Filetype c nmap <C-S-x> 0xx
autocmd Filetype c imap <C-S-x> jj<C-S-x>

autocmd FileType cpp nmap ff :!time ./%<
autocmd FileType cpp nmap <F5>  :!time ./%<<CR>
autocmd FileType cpp nmap <F6>  :!time ./%<  < in<CR>
autocmd FileType cpp nmap <F9> <ESC>\x:w<CR>:!g++ -O3 -D DEBUG -g -std=c++14 -Wall -Wextra -Wshadow -Wno-unused-result % -o %<<CR>
autocmd FileType cpp nmap <F12> <ESC>\x:w<CR>:!g++ -O3 -D DEBUG -g -std=c++14 -Wall -Wextra -Wshadow -Wno-unused-result % -o %< && time ./%<<CR>

autocmd FileType cpp imap <F9> <ESC>\x:w<CR>:!g++ -O3 -D DEBUG -g -std=c++14 -Wall -Wextra -Wshadow -Wno-unused-result % -o %<<CR>
autocmd FileType cpp imap <F12> <ESC>\x:w<CR>:!g++ -O3 -D DEBUG -g -std=c++14 -Wall -Wextra -Wshadow -Wno-unused-result % -o %< && time ./%<<CR>

autocmd Filetype cpp nmap <C-S-c> 0i//<Esc>
autocmd Filetype cpp imap <C-S-c> jj<C-S-c>
autocmd Filetype cpp nmap <C-S-x> 0xx
autocmd Filetype cpp imap <C-S-x> jj<C-S-x>

autocmd FileType python nmap <F11> <ESC>\x:w<CR>:!python3 %<CR>
autocmd FileType python nmap <F12> <ESC>\x:w<CR>:!python3 %<CR>
autocmd FileType python imap <F11> <ESC>\x:w<CR>:!python3 %<CR>
autocmd FileType python imap <F12> <ESC>\x:w<CR>:!python3 %<CR>

autocmd Filetype python nmap <C-S-c> 0i#<Esc>
autocmd Filetype python imap <C-S-c> <Esc><C-S-c>
autocmd Filetype python nmap <C-S-x> 0x
autocmd Filetype python imap <C-S-x> <Esc><C-S-x>

autocmd FileType tex nmap <F10> <ESC>\x:w<CR>:!gnome-open %<.pdf<CR><CR>
autocmd FileType tex nmap <F12> <ESC>\x:w<CR>:!xelatex %<CR>
autocmd FileType tex imap <F10> <ESC>\x:w<CR>:!gnome-open %<.pdf<CR><CR>
autocmd FileType tex imap <F12> <ESC>\x:w<CR>:!xelatex %<CR>

autocmd Filetype tex nmap <C-S-c> 0i%<Esc>
autocmd Filetype tex imap <C-S-c> jj<C-S-c>
autocmd Filetype tex nmap <C-S-x> 0x
autocmd Filetype tex imap <C-S-x> jj<C-S-x>

set fdm=indent
set foldlevel=0
set foldnestmax=1
set foldminlines=1

syntax on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

au FocusLost * :set norelativenumber
au FocusGained * :set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 '
