"Config general de Vim
set number
set mouse=a
set numberwidth=1 
set showcmd
set cursorline
set clipboard=unnamed
set pastetoggle=<F2>
set t_Co=256
set termguicolors
syntax enable
set ruler
set encoding=UTF-8
set showmatch
set relativenumber
set laststatus=2
set incsearch
"Fuente y tamaño de letra
set gfn=FiraCode_NF:h18:cANSI:qDRAFT
"esconde la barra
set guioptions=i
"Desactivar las campanas
set noeb vb t_vb=
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
"aquí termina
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
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-fugitive'
"Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
call plug#end()
"Config Latex
"let g:livepreview_previewer = 'okular'
"Config lsp
let g:markdown_fenced_lenguages = [
	\'vim'
	\'help'
	\]
"Configuración de markDown
let g:mkdp_auto_start = 1

"Configuración de COC
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
"Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"Solo funcionan si están son un server de lenguaje activo
" GoTo code navigation.
"nmap <silent> gD <Plug>(coc-definition)
"nmap <silent> gY <Plug>(coc-type-definition)
"nmap <silent> gI <Plug>(coc-implementation)
"nmap <silent> gR <Plug>(coc-references)

"Airline extention
let g:airline#extensions#coc#enabled = 1
"Comando de themas
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

"Comando de NerdTree
let NERDTreeQuitOnOpen=1
"Airline config style
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
let g:airline#extension#tabline#left_alt_sep=' '
let g:airline#extensions#tabline#formatter='default'
"Themas airline
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.branch = ''
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
"NerdTree
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_ctrlp = 1
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
"Atajos de git
nmap <Leader>gs :G<CR>
nmap <Leader>gc :Gcommit<CR>
"Busca los nombres que contiene las dos letras
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
"Atajos para pasar de tab y cerrar tab
nmap <Leader>ne :bnext<CR> 
nmap <Leader>e :bd<CR>
"Atajo abre terminal
nmap <Leader>t :vert terminal<CR>
nmap <Leader>vs :vsp <CR>
"Atajo para abrir .vimrc
nmap <Leader>rc :e $MYVIMRC<CR>
"Spell checker
nmap <leader>a <Plug>(coc-codeaction-selected)
" Create markmap from the whole file
nmap <Leader>m <Plug>(coc-markmap-create)
" Create markmap from the selected lines
vmap <Leader>m <Plug>(coc-markmap-create-v)
"Commandos para compilar
"Con archivo compilador.bath
autocmd filetype cpp nnoremap <f6> :w <bar> :!Compile <CR>
autocmd filetype cpp nnoremap <f5> :w <bar> :!g++ % <CR> :!a <CR>
autocmd filetype python nnoremap <f5> :w <bar> :!python % <CR>
autocmd filetype go nnoremap <f5> :w <bar> :!go run %<CR>
autocmd filetype js nnoremap <f5> :w <bar>:!node % <CR>
