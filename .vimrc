set nocompatible		" get rid of strict vi compatibility!:q


" set modeline			" File-specific vim directives
set fileformats=unix,dos,mac	" open files from mac/dos
set exrc			" open local config files
filetype plugin on
syntax on


" https://coderwall.com/p/sdhfug/vim-swap-backup-and-undo-files
" Keep backup files from polluting the project directory
set undofile
set undodir=~/.vim/.undo/
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/

":Man
runtime! ftplugin/man.vim


source ~/.vim/.vimrc-syntax     " Syntax highlighting
source ~/.vim/.vimrc-mappings   " Mappings & anything else that affects the action of keys that
                                " may affect text
source ~/.vim/.vimrc-ui         " Appearance of vim & action of commands that don't affect text
source ~/.vim/.vimrc-formatting " Text formatting

au BufEnter *.c compiler gcc

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
