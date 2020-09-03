"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/"
"cd .vim/bundle/YouCompleteMe; ./install.py --all"
"https://github.com/rust-lang/rust.vim"
"rustup component add rustfmt"
"rustup component add clippy"
":BundleInstall

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030
set paste
set tabstop=4
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'cespare/vim-golang'
Bundle 'Blackrush/vim-gocode'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'rust-lang/rust.vim'
"go get -v github.com/rogpeppe/godef
Bundle 'dgryski/vim-godef'

set formatprg=stylish-haskell
"autocmd BufWrite *.hs :Autoformat
"Don't automatically indent on save, since vim's autoindent for haskell is buggy
autocmd FileType haskell let b:autoformat_autoindent=1

:map <F5> :Tagbar<CR>
:map <F6> :NERDTree<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
        \ }
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
filetype plugin indent on
autocmd BufWritePre *.go :Fmt
syntax on
set paste
let g:godef_split=3 "左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 "函数在同一个文件中时不需要打开新窗口
"~/.vim/bundle/vim-godef/plugin/godef.vim中添加下面两行
"autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor()<cr>
"autocmd FileType go nnoremap <buffer> <C-]> :call GodefUnderCursor()<cr>
