set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins

Plugin 'stephpy/vim-yaml'

Plugin 'rainglow/vim'

Plugin 'scrooloose/syntastic'

Plugin 'majutsushi/tagbar'

Plugin 'rust-lang/rust.vim'

call vundle#end()

filetype plugin indent on

set backspace=indent,eol,start

set history=200
set ruler
set showcmd
set wildmenu

set ttimeout
set ttimeoutlen=100

set display=truncate

set scrolloff=5

if has('reltime')
	set incsearch
endif

set nrformats-=octal

map Q gq

inoremap <C-U> <C-G>u<C-U>
nmap <F8> :TagbarToggle<CR>

if &t_Co > 2 || has("gui_running")
	syntax on
	let c_comment_strings=1
endif

if 1
	augroup vimStartup
		au!
		autocmd BufReadPost *
			\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
			\ | exe "normal! g`\""
			\ | endif
	augroup END
endif

if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

set number
colorscheme codecourse

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

