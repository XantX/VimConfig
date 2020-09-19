"Config general de Vim
set number
set mouse=a
set numberwidth=1 
set showcmd
set cursorline
set clipboard=unnamed
set pastetoggle=<F2>
set t_Co=256
syntax enable
set rnu
set ruler
set encoding=UTF-8
set showmatch
set relativenumber
set laststatus=2
"Fuente y tamanio de letra
set gfn=Hack:h14:cANSI:qDRAFT
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
"Plug 'ryanoasis/vim-devicons'
call plug#end()

"Comando de themas
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

"Comando de NerdTree
let NERDTreeQuitOnOpen=1
let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" Comando de barra de estado 
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#formatter='default'
"Themas airline
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"Airline Themes
"let g:airline_theme='onedark' 
"let g:airline_theme='dark'
"let g:airline_theme='badwolf'
"let g:airline_theme='simple'
"let g:airline_theme='term'
"let g:airline_theme='kolor'
let g:airline_theme='base16'
"let g:airline_theme='molokai'
"let g:airline_theme='powerlineish'


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
autocmd filetype cpp nnoremap <f6> :w <bar> :!g++ % <CR> :!a <CR>
autocmd filetype python nnoremap <f5> :w <bar> :!python % <CR>
autocmd filetype go nnoremap <f5> :w <bar> :!go run %<CR>
