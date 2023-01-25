" use 256 color xterm
set term=xterm-256color
filetype on
syntax on

" add line numbers
set number

" use bash when typing in system commands
set shell=/bin/bash
set shellcmdflag="-l"

" change line number color
highlight LineNr ctermfg=241

" change search highlight color
set hlsearch 
highlight Search ctermbg=241
highlight Visual ctermbg=194

" folding configuration
set foldlevel=99
highlight Folded ctermbg=0 ctermfg=5

" prevent search from jumping to next match
nnoremap * :keepjumps normal! mi*`i<CR>

" no wrap when searching
set nowrapscan

" change cursor style between insert and normal modes
autocmd InsertEnter,InsertLeave * set cul!
set ttimeout
set ttimeoutlen=1
set ttyfast

" automatically update a file when going back to it
set autoread

" not replace tabs with 4 spaces for Makefiles
"autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
"replace tabs with 4 spaces
set expandtab
set tabstop=4

" do not clear clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" set filetypes
autocmd BufNewFile,BufRead *.tpf set filetype=tpf
autocmd BufNewFile,BufRead *.robot set filetype=robot
autocmd BufNewFile,BufRead *.gdb set filetype=gdb
autocmd BufNewFile,BufRead *.gcov set filetype=gcov
autocmd BufNewFile,BufRead ld_* set filetype=ld
autocmd BufNewFile,BufRead Makefile.* set filetype=make

"autocmd BufNewFile,BufRead *.c set filetype=myc
"autocmd BufNewFile,BufRead *.h set filetype=myc

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" omnicompletion nice menu 
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" enable dolding zM folds everything zR unfold everything
" foldlevel=1 unfold everythin when open a file
"set foldmethod=syntax
"set foldlevel=100
"

" set gf to go to include file and use gh to return
nnoremap gh :bf<CR>

" store swp files somewhere else to avoid seeing them in git status
set directory=/users/c68739/.swp

" repo specific prameters
" set tags+=/projects/k2072/users/nima/repo/tags


" vim package manager
" execute pathogen#infect()

set backspace=indent,eol,start

" for debugging inside vim
if v:version > 900
    packadd termdebug
    let g:termdebugger='/projects/k2072/users/jadarite/toolchain/gdb-12.1-mips/bin/mips-gdb'
    let g:termdebug_wide=1

    hi debugPC ctermfg=10 ctermbg=17
    hi SignColumn ctermfg=0 ctermbg=0
endif

