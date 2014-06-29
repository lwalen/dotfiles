" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" enable syntax highlighting
if has("syntax")
	syntax on
endif


" remember last position in file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif

" enable auto-indentation
filetype plugin indent on

set number           " enable line numbering
set tabstop=3        " tabs are 3 characters wide
set shiftwidth=3     " indent by 3 spaces
set shellcmdflag=-ic " enable bash aliases
set hlsearch         " enable highlighting search results
set autochdir        " automatically changes directory

au BufRead,BufNewFile *.html.erb set shiftwidth=4 tabstop=4
au BufRead,BufNewFile *.haml set shiftwidth=2 tabstop=2 noexpandtab
au BufRead,BufNewFile *.md set filetype=markdown

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
