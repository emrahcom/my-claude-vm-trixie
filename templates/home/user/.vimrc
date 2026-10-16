set nocompatible
syntax on
filetype off
filetype plugin indent on

set is
set ic
set smartcase
nnoremap / /\v
vnoremap / /\v
set hidden
set bg=dark
set encoding=utf-8
set scrolloff=3
set showcmd

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

autocmd InsertEnter * set cursorline cursorcolumn
autocmd InsertLeave * set nocursorline nocursorcolumn
highlight cursorline cterm=none ctermfg=7 ctermbg=4
highlight cursorcolumn cterm=none ctermfg=7 ctermbg=4
autocmd FileType markdown call Default()
autocmd FileType php call Default()
autocmd FileType python call Default()
autocmd FileType sh call Default()
autocmd FileType yaml call Yaml()
autocmd BufNewFile,BufRead *.sql call Default()
autocmd BufNewFile,BufRead README,*.txt call Text()
autocmd BufNewFile,BufRead *.java call Java()
autocmd BufNewFile,BufRead *.js,*.json call Javascript()
autocmd BufNewFile,BufRead *.ts call Typescript()
autocmd BufNewFile,BufRead *.html,*.css call Html()
autocmd BufNewFile,BufRead *.svelte call Svelte()

function Default()
  setlocal
  \ textwidth=80
  \ tabstop=4
  \ shiftwidth=4
  \ softtabstop=4
  \ expandtab
  \ autoindent
  \ nosmartindent
  \ nocindent
  \ list
  \ listchars=tab:»·,trail:·
endfunction

function Text()
  setlocal
  \ textwidth=80
  \ tabstop=4
  \ shiftwidth=4
  \ softtabstop=4
  \ expandtab
  \ autoindent
  \ nosmartindent
  \ nocindent
  \ list
  \ listchars=tab:»·,trail:·
  \ filetype=txt
  \ syntax=conf
endfunction

function Java()
  setlocal
  \ textwidth=80
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ nosmartindent
  \ nocindent
  \ list
  \ listchars=tab:»·,trail:·
  \ filetype=java
  \ syntax=java
endfunction

function Javascript()
  setlocal
  \ textwidth=80
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ nosmartindent
  \ nocindent
  \ list
  \ listchars=tab:»·,trail:·
  \ filetype=javascript
  \ syntax=javascript
endfunction

function Typescript()
  setlocal
  \ textwidth=80
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ nosmartindent
  \ nocindent
  \ list
  \ listchars=tab:»·,trail:·
  \ filetype=typescript
  \ syntax=typescript
endfunction

function Svelte()
  setlocal
  \ textwidth=80
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ nosmartindent
  \ nocindent
  \ list
  \ listchars=tab:»·,trail:·
  \ filetype=html
  \ syntax=html
endfunction

function Html()
  setlocal
  \ textwidth=120
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ nosmartindent
  \ nocindent
  \ list
  \ listchars=tab:»·,trail:·
endfunction

function Yaml()
  setlocal
  \ textwidth=80
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab
  \ autoindent
  \ nosmartindent
  \ nocindent
  \ list
  \ listchars=tab:»·,trail:·
  \ filetype=yaml
  \ syntax=yaml
endfunction
