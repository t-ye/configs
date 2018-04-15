" ~/.vimrc
" Lisa McCutcheon
" Wed Feb 07, 2007

" **************************************
" * VARIABLES
" **************************************
set nocompatible		" get rid of strict vi compatibility!
set nu				" line numbering on
set autoindent			" autoindent on
set noerrorbells		" bye bye bells :)
set modeline			" show what I'm doing
set showmode			" show the mode on the dedicated line
set nowrap			" no wrapping!
set ignorecase			" search without regards to case
set backspace=indent,eol,start	" backspace over everything
set fileformats=unix,dos,mac	" open files from mac/dos
set exrc			" open local config files
set nojoinspaces		" don't add white space when I don't tell you to
set ruler			" which line am I on?
set showmatch			" ensure Dyck language
set incsearch			" incremental searching
set nohlsearch			" meh
set bs=2			" fix backspacing in insert mode
set bg=light
set nonu                        " no line numbers
scriptencoding utf-8
set encoding=utf-8
" Expand tabs in C files to spaces
au BufRead,BufNewFile *.{c,h,java} set expandtab
au BufRead,BufNewFile *.{c,h,java} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java} set tabstop=2

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8
set background=dark
" Show syntax
syntax on

" This is my prefered colorscheme, feel free to choose another colorscheme 
" (You can try out other colors by doing :colorscheme in command mode, then 
" press space, then tab.  Keep pressing tab to cycle through all the colorscheme
" options).
:colors desert

" For switching between many opened file by using ctrl+l or ctrl+h
map <C-J> :next <CR>
map <C-K> :prev <CR>

" Spelling toggle via F10 and F11
map <F10> <Esc>setlocal spell spelllang=en_us<CR>
map <F11> <Esc>setlocal nospell<CR>

function! FileHeading()
          let s:line=line(".")
          call setline (s:line,   "/*")
          call append  (s:line,   " * Filename: " .expand("%"))
          call append  (s:line+1, " * Author: Thurman Ye")
          call append  (s:line+2, " * Userid: cs30xqy")
          call append  (s:line+3, " * Description: TODO")
          call append  (s:line+4, " * Date: " .strftime("%b %d %Y"))
          call append  (s:line+5, " * Sources of Help: TODO")
          call append  (s:line+6, " */")
          unlet s:line
endfunction
   
function! AssemblyFunctionHeading()
          let s:line=line(".")
          call setline (s:line,   "/*")
          call append  (s:line,   " * Function Name: TODO")
          call append  (s:line+1, " * Function Prototype: TODO")
          call append  (s:line+2, " * Description: TODO")
          call append  (s:line+3, " * Side Effects: TODO")
          call append  (s:line+4, " * Error Conditions: TODO")
          call append  (s:line+5, " * Return Value: TODO")
          call append  (s:line+6, " * ")
          call append  (s:line+7, " * Registers used: TODO")
          call append  (s:line+8, " */")
          unlet s:line
endfunction

imap <F9> <ESC>mz:execute FileHeading()<CR>
imap <F10> <ESC>:call AssemblyFunctionHeading()<CR>

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9

augroup vimrc_autocmds
	autocmd!
autocmd BufEnter,WinEnter * call matchadd('OverLength', '\%>80v.\+', -1)
augroup END

" inoremap <Esc> <Esc>:w<CR>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

