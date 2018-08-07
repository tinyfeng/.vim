set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-pathogen'
Plugin 'rstacruz/sparkup'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
execute pathogen#infect()
call pathogen#helptags()
set runtimepath^=~/.vim/bundle/ag
let NERDTreeMinimalUI=1
syntax on
colorscheme molokai

" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set textwidth=200

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Make it obvious where 80 characters is
" set colorcolumn=80

" Numbers
set number
set numberwidth=5

set matchpairs+=<:>
set hlsearch

set cursorcolumn
set cursorline

" 按下ctrl键 +j或者k，快速上下移动
nnoremap <C-j> 5j
nnoremap <C-k> 5k

" 在换行的一行中上下移动
nnoremap j gj
nnoremap k gk
let g:neocomplete#enable_at_startup = 1

" 高亮所在列
highlight CursorColumn cterm=NONE ctermbg=yellow guibg=NONE guifg=NONE 
" ctermfg=green 

let mapleader=";"
" ;sh 跳转到shell，输入exit回到vim
nnoremap <leader>sh :sh<cr>

let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0


" 为了ruby 编程方便,_ -相互替换
inoremap - _
inoremap _ -

" ;ag 全局搜索文本
nnoremap <leader>ag :Ag 
" ;ff ctrlp查找文件
map <leader>ff <C-p>
" ;q 强制退出
map <leader>q :q!<cr>
" ;w 保存
map <leader>w :w!<cr>
" ;W 保存并退出
map <leader>W :wq!<cr>
" ;Q 退出全部窗口
map <leader>Q :qa!<cr>
" ;e 保存只读文件
map <leader>ww :w !sudo tee %<cr>
