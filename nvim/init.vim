if filereadable(expand('$XDG_CONFIG_HOME/nvim/visual.vim'))
    source $XDG_CONFIG_HOME/nvim/visual.vim
endif

if filereadable(expand('$XDG_CONFIG_HOME/nvim/keybind.vim'))
    source $XDG_CONFIG_HOME/nvim/keybind.vim
endif

if filereadable(expand('$XDG_CONFIG_HOME/nvim/local.vim'))
    source $XDG_CONFIG_HOME/nvim/local.vim
endif

set nocp
set ls=2
set ruler
set number
set ignorecase
set modeline
set nobackup
set noswapfile
set nowrap
set hidden
set backspace=indent,eol,start
set cursorline
set cindent
set incsearch

set tabstop=4
set shiftwidth=4
set softtabstop=0

syntax on
filetype plugin on
set ofu=syntaxcomplete#Complete
set ambiwidth=double

highlight Pmenu ctermbg=blue ctermfg=white
highlight PmenuSel ctermbg=blue ctermfg=red
highlight PmenuSbar ctermbg=cyan ctermfg=green
highlight PmenuThumb ctermbg=white ctermfg=red

set completeopt=longest,menuone

let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

command Exp :set expandtab|:retab
command Uexp :set noexpandtab|:retab!

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/sasai/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/sasai/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/sasai/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"
" or
"
"writeing dein/dein.toml
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#load_toml('~/.config/nvim/dein/dein.toml', {'lazy': 0})
    call dein#load_toml('~/.config/nvim/dein/dein_lazy.toml', {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
