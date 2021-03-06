set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'djoshea/vim-autoread'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/ag.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" 括号自动补全
Plugin 'Raimondi/delimitMate'
Plugin 'udalov/kotlin-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'chemzqm/wxapp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
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

" disable creating .swp file
set noswapfile

" 按下ctrl键 +j或者k，快速上下移动
nnoremap <C-j> 5j
nnoremap <C-k> 5k
vnoremap <C-j> 5j
vnoremap <C-k> 5k

" 在换行的一行中上下移动
nnoremap j gj
nnoremap k gk
let g:neocomplete#enable_at_startup = 0

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


autocmd Filetype ruby call SetRubyOptions()
function SetRubyOptions()
  nnoremap <Leader>sc :Ag "class <cword>" <cr><cr>
endfunction

" java 设置
autocmd Filetype java call SetJavaOptions()
function SetJavaOptions()
  set tabstop=4
endfunction

" ;ag 全局搜索文本
nnoremap <leader>ag :Ag ""<Left>
" ;ff ctrlp查找文件
map <leader>ff <C-p>
" ;q 强制退出
map q :q<cr>
" ;w 保存
map <leader>w :w!<cr>
" ;W 保存并退出
map W :wq!<cr>
" ;Q 退出全部窗口
map Q :qa!<cr>
" ;e 保存只读文件
map <leader>e :w !sudo tee %<cr>
" ;tn 打开或关闭目录数
map <leader>tn :NERDTreeToggle<cr>

map <Leader>gb :Gblame<cr>

nnoremap <f2> $
nnoremap <f1> ^
imap <f2> <esc>$a
imap <f1> <esc>^i
set autoread
au CursorHold * checktime
nnoremap <Leader>rl :bufdo e<cr>
nnoremap da ciw<esc>
nnoremap dA ciW<esc>
nnoremap yw viwy
imap ;5 <%  %><left><left><left>
imap ;% <%=  %><left><left><left>
imap ;di <div></div><esc>5<left>i
imap <c-h> <left>
imap <c-j> <down>
imap <c-k> <up>
imap <c-l> <right>
imap <c-e> <esc>ea
imap <c-w> <esc>wi
imap <c-b> <esc>bi
nnoremap ;' bi'<esc>ea'<esc>

" 选中高亮
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE


"auto save
autocmd TextChanged,TextChangedI <buffer> silent write

:set nomodeline
let g:ctrlp_clear_cache_on_exit = 0
set undofile
set undodir=~/.vim/undo/
nnoremap <Leader>bo :browse oldfiles<cr>
nnoremap ;sb  :%!xxd<cr>
nnoremap ;sn  :%!xxd -r<cr>

nnoremap <Leader>i :JavaImport<cr>
nnoremap <Leader>d :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
nnoremap <Leader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
nnoremap <Leader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
nnoremap <Leader>jc :JavaCorrect<cr>
nnoremap <Leader>ac :Ag "<cword>" <cr>

" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='open'
let g:EclimCompletionMethod = 'omnifunc'
