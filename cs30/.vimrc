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
" au BufRead,BufNewFile *.{c,h,java} set expandtab
au BufRead,BufNewFile *.{c,h,java} set noexpandtab
au BufRead,BufNewFile *.{c,h,java} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java} set tabstop=2
" au BufRead,BufNewFile *.{c,h,java} %retab!
" args *.js | argdo retab

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

set textwidth=80


" https://coderwall.com/p/sdhfug/vim-swap-backup-and-undo-files
" Keep backup files from polluting the project directory
set undodir=~/.vim/.undo/
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/

" This is my prefered colorscheme, feel free to choose another colorscheme
" (You can try out other colors by doing :colorscheme in command mode, then
" press space, then tab.  Keep pressing tab to cycle through all the colorscheme
" options).
"hi SpecialKey ctermfg=LightGreen
"hi NonText ctermfg=LightGreen

" For switching between many opened file by using ctrl+l or ctrl+h
" map <C-J> :next <CR>
" map <C-K> :prev <CR>

" Spelling toggle via F10 and F11
" map <F10> <Esc>setlocal spell spelllang=en_us<CR>
" map <F11> <Esc>setlocal nospell<CR>

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

function! AssemblyRoutineHeading()
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


function! AssemblyRoutineHeading()
          let s:line=line(".")
          call setline (s:line,   "/*")
          call append  (s:line,   " * Function Name: TODO")
          call append  (s:line+1, " * Function Prototype: TODO")
          call append  (s:line+2, " * Description: TODO")
          call append  (s:line+3, " * Parameters: TODO")
          call append  (s:line+4, " * Side Effects: TODO")
          call append  (s:line+5, " * Error Conditions: TODO")
	  call append  (s:line+6, " * Return Value: TODO")
	  call append  (s:line+7, " * ")
	  call append  (s:line+8, " * Registers used: TODO")
	  call append  (s:line+9, " * 	<register> - <use> -- <description>")
	  call append  (s:line+10, " * ")
	  call append  (s:line+11, " * Local variables: TODO")
	  call append  (s:line+12, " * 	<name> - <fp offset> -- <description>")
	  call append  (s:line+13, " */")
          unlet s:line
endfunction

function! FunctionHeading()
          let s:line=line(".")
          call setline (s:line,   "/*")
          call append  (s:line,   " * Function Name: TODO")
          call append  (s:line+1, " * Function Prototype: TODO")
          call append  (s:line+2, " * Description: TODO")
          call append  (s:line+3, " * Parameters: TODO")
          call append  (s:line+4, " * Side Effects: TODO")
          call append  (s:line+5, " * Error Conditions: TODO")
          call append  (s:line+6, " * Return Value: TODO")
          call append  (s:line+7, " */")
          unlet s:line
endfunction

function! RaspberryPiDirectives()
          let s:line=line(".")
          call setline (s:line,   "@ Raspberry Pi directives")
          call append  (s:line,   "	.cpu	cortex-a53	@ Version of our Pis")
          call append  (s:line+1, "	.syntax	unified		@ Modern ARM syntax")
          call append  (s:line+2, "	.equ	FP_OFFSET, 4	@ Offset to set fp to base of saved regs.")
          call append  (s:line+3, "")
          call append  (s:line+4, "	.global TODO		@ Allow this label to be linked to other files")
          call append  (s:line+5, "")
          call append  (s:line+6, "	.text			@ Switch to text segment")
          call append  (s:line+7, "	.align 2		@ Align onevenly divisible by 4 byte address")
	  call append  (s:line+8, "				@ .align n: 2^n determines alignment")
          call append  (s:line+9, "")
          unlet s:line
endfunction

imap <F9> <ESC>:execute FileHeading()<CR>
imap <F10> <ESC>:call AssemblyRoutineHeading()<CR>
imap <F12> <ESC>:call FunctionHeading()<CR>


" inoremap <Esc> <Esc>:w<CR>
" ???
imap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
noremap <C-c> <Esc>:x<CR>
inoremap <C-c> <Esc>:x<CR>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif
endif

" Automatically remove trailiing whitespace on each save
autocmd BufWritePre * %s/\s\+$//e

" Output the current syntax group
" nnoremap <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>


" hi StatusLine ctermfg=black ctermbg=white cterm=bold
" hi StatusLineNC ctermfg=black ctermbg=white cterm=bold

" hi StatusLine   ctermfg=red ctermbg=black cterm=bold gui=bold,italic
" hi StatusLineNC ctermfg=grey ctermbg=black cterm=none gui=none


" Show syntax
syntax on
set background=dark
" set background=light
colorscheme gruvbox
hi PreProc ctermfg=Red
" Change color of function labels.
au BufRead,BufNewFile *.{sh} hi Function ctermfg=Green

" Don't let vim give the background a different color.
hi Normal ctermbg=None
hi NonText ctermbg=None ctermfg=gray
hi VertSplit cterm=none ctermfg=red

" Highlight settings for too-long lines.
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9

augroup vimrc_autocmds
	autocmd!
	autocmd BufEnter,WinEnter *.s call matchadd('OverLength', '\%>80v.\+', -1)
	autocmd BufEnter,WinEnter *.c call matchadd('OverLength', '\%>80v.\+', -1)
	autocmd BufEnter,WinEnter *.h call matchadd('OverLength', '\%>80v.\+', -1)
	autocmd BufEnter,WinEnter README call matchadd('OverLength', '\%>80v.\+', -1)
augroup END

" Multiline comments
set comments=sl:/*,mb:\ *,elx:*/

" Automatically insert the current comment leader after hitting <Enter>.
set formatoptions+=r

" Automatically insert the current comment leader after hitting 'o' or 'O'.
set formatoptions+=o

" join multiline // comments if possible
set formatoptions+=j

" Auto format for comments
set formatoptions+=c

" Make spacing keys work in normal mode.
nnoremap <Space> i<Space><Right><ESC>
nnoremap <CR> i<CR><ESC>^
nnoremap <Tab> i<Tab><ESC>l

" Can increment/decrement letters
set nrformats+=alpha

" https://shapeshed.com/vim-templates/
if has("autocmd")
	augroup templates
		autocmd BufNewFile *.s 0r ~/.vim/templates/template.s
		autocmd BufNewFile *.s %s/\CFILENAME/\=expand("%:t:r")/g
		autocmd BufNewFile *.s %s/\CDATE/\=strftime("%b %d %Y")/g

		autocmd BufNewFile *.c 0r ~/.vim/templates/template.c
		autocmd BufNewFile *.c %s/\CFILENAME/\=expand("%:t:r")/g
		autocmd BufNewFile *.c %s/\CDATE/\=strftime("%b %d %Y")/g
	augroup END
endif

" Use a file to store undos persistently. "
set undofile
set undodir=~/.vim/.vimundo


" Make Esc'ing faster
set timeout timeoutlen=1000 ttimeoutlen=10

" Scripts are sourced automatically.

" Multiline function arguments
set cino+=(0

" Ctrl+s save
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>l

" Auto-brace
inoremap {<CR> {<CR>}<Esc>ko<Tab>

noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
"nmap  :w           <NOP>
"nmap :x            <NOP>

" Highlight the line the cursor is on.
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=DarkBlue

" Change the cursor line highlighting when leaving the current buffer.
augroup cursorlinehighlighting
	autocmd!
	autocmd InsertLeave * hi CursorLine ctermbg=DarkBlue term=bold cterm=bold
	autocmd InsertEnter  * hi CursorLine ctermbg=DarkBlue cterm=underline,bold term=underline,bold
augroup END

" Cool line number stuff
"set number relativenumber
"augroup numbertoggle
"	autocmd!
"	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

"set noruler
set noshowmode
"set laststatus=0

" Case sensitive search by default only when capital letters are present
set smartcase
hi Comment ctermfg=Cyan

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

runtime! ftplugin/man.vim
