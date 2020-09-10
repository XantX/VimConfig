"Config general de Vim
set number
set mouse=a
set numberwidth=1 
set showcmd
set cursorline
set clipboard=unnamed
syntax enable
set ruler
set encoding=utf-8
set showmatch
set relativenumber
set laststatus=2
"Fuente y tamanio de letra
set gfn=Consolas:h14:cANSI:qDRAFT
"esconde la barra
set guioptions=i
"Funcion para esconder la barra de menu
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imrL')
  else
    exec('set guioptions=i')
  endif
endfunction
"Comando para esconder
map <F11> <Esc>:call ToggleGUICruft()<cr>
"aqui termina
set wildmenu
set backspace=indent,eol,start
set autoindent
set smartindent

"Zona de plugins
call plug#begin('~/.vim/plugged')

"Temas
Plug 'morhetz/gruvbox'
"IDE
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'KabbAmine/zeavim.vim'
call plug#end()

"Comando de themas
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

"Comando de NerdTree
let NERDTreeQuitOnOpen=1

" Comando de barra de estado
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#formatter='default'
"variable para insertar comandos
let mapleader = " "
"Comandos de busqueda de docs
"Ubicaciones de el programa
let g:zv_zeal_executable = 'C:\Users\SEBASTIAN\Desktop\Cosas\Cosas de programacion\Zeal\zeal.exe'
nmap gzz <Plug>Zeavim
vmap gzz <Plug>ZVVisSelection
nmap <Leader>z <Plug>ZVKeyDocset
nmap gZ <Plug>ZVKeyDocset<CR>
nmap gz <Plug>ZVOperator
"Atajos de teclado
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>ne :bnext<CR> 
nmap <Leader>e :bd<CR>
"Comandos para compilar
autocmd filetype cpp nnoremap <f5> :w <bar> :!Compile <CR>
autocmd filetype python nnoremap <f5> :w <bar> :!python % <CR>
autocmd filetype go nnoremap <f5> :w <bar> :!go run %<CR>
