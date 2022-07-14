
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" show file name at bottom
set laststatus=2

color delek

" use ctrl-[DIRECTION] to move between split windows instead of ctrl-w-[DIRECTION]
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

" show line numbers
    set number 

" Splits open at bottom and right (vim defaults top and left)
    set splitbelow splitright

" Reads as intended filetypes
    autocmd BufRead,BufNewFile *.ejs set filetype=html

"""" Snippets

" HTML
autocmd FileType html inoremap <buffer> ,<Tab> ><Esc>^i<<Esc>vEyEp%a/<Left><Left>
autocmd FileType html inoremap <buffer> ,c <Esc>I<div<Space>class="<Esc>A"></div><Esc>T>i
autocmd FileType html inoremap <buffer> ,ejs <%<Space><Space>%><Esc>hhi

" Javascript
autocmd FileType javascript inoremap <buffer> ,r <Space>=<Space>require('');<Esc>F'i

" Rust
autocmd FileType rust nnoremap <buffer> ,t :wa<Enter>:!cargo<Space>test<Enter>
autocmd FileType rust nnoremap <buffer> ,r :wa<Enter>:!cargo<Space>run<Enter>
