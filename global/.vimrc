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

" https://coderwall.com/p/sdhfug/vim-swap-backup-and-undo-files
" Keep backup files from polluting the project directory
set undodir=~/.vim/.undo/

set backupdir=~/.vim/.backup/

set directory=~/.vim/.swp/

" This is my prefered colorscheme, feel free to choose another colorscheme 
" (You can try out other colors by doing :colorscheme in command mode, then 
" press space, then tab.  Keep pressing tab to cycle through all the colorscheme
" options).
:colors slate

" For switching between many opened file by using ctrl+l or ctrl+h
map <C-J> :next <CR>
map <C-K> :prev <CR>

" Spelling toggle via F10 and F11
" map <F10> <Esc>setlocal spell spelllang=en_us<CR>
" map <F11> <Esc>setlocal nospell<CR>

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
nnoremap <C-h> <left>
nnoremap <C-j> <down>
nnoremap <C-k> <up>
nnoremap <C-l> <right>

" Uncomment the following to have Vim jump to the last position when 
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif
endif


" Uncomment the following to have Vim jump to the last position when 
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal! g'\"" | endif
endif

" http://vim.wikia.com/wiki/Automatically_create_tmp_or_backup_directories
function! InitBackupDir()
  if has('win32') || has('win32unix') "windows/cygwin
    let l:separator = '_'
  else
    let l:separator = '.'
  endif
  let l:parent = $HOME . '/' . l:separator . 'vim/'
  let l:backup = l:parent . 'backup/'
  let l:tmp = l:parent . 'tmp/'
  if exists('*mkdir')
    if !isdirectory(l:parent)
      call mkdir(l:parent)
    endif
    if !isdirectory(l:backup)
      call mkdir(l:backup)
    endif
    if !isdirectory(l:tmp)
      call mkdir(l:tmp)
    endif
  endif
  let l:missing_dir = 0
  if isdirectory(l:tmp)
    execute 'set backupdir=' . escape(l:backup, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if isdirectory(l:backup)
    execute 'set directory=' . escape(l:tmp, ' ') . '/,.'
  else
    let l:missing_dir = 1
  endif
  if l:missing_dir
    echo 'Warning: Unable to create backup directories:' l:backup 'and' l:tmp
    echo 'Try: mkdir -p' l:backup
    echo 'and: mkdir -p' l:tmp
    set backupdir=.
    set directory=.
  endif
endfunction
call InitBackupDir()
