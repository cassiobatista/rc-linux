""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/.nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'
let g:indentLine_setConceal = 0

"Plugin 'robertbasic/vim-hugo-helper'

"Plugin 'szymonmaszke/vimpyter'
"Plugin 'jupyter-vim/jupyter-vim'

Plugin 'previm/previm.git'
let g:previm_open_cmd = 'google-chrome-stable'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""

set viminfo='10,\"30,:20,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

set list lcs=tab:.\ ,trail:\ ,extends:>,precedes:< 

cab Vs  vs
cab Set set
cab W   w
cab qw  wq
cab Wq  wq
cab wQ  wq
cab WQ  wq
cab Q   q
cab Wa  wa
cab WA  wa
cab wA  wa
cab Qa  qa
cab QA  qa
cab qA  qa

fu! CommOnOff()
  if !exists('g:hiddcomm')
    let g:hiddcomm=1 | hi Comment ctermfg=black guifg=black
  else
    unlet g:hiddcomm | hi Comment ctermfg=cyan  guifg=cyan cterm=NONE
  endif
endfu
map <F6> :call CommOnOff()<cr>

hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan

set is hls scs              "opções espertas de busca
set sm                      "oninício do bloco recém fechado
set sw=4                    "ShiftWidth: número de colunas para o comando >
set ruler                   "régua: mostra a posição do cursor
set shm=filmnrwxt           "ShortMessages: encurta as mensagem da régua
set wildmode=longest,list   "para completação do TAB igual ao bash
set number                  "para mostrar o numero ao lado
set title
" barra de status
set statusline=%F%m%r%h%w\ [%Y][%l,%v][%p%%][%L]
set laststatus=2
set cursorline              "mostra a linha do cursor
set sm
set tabstop=4
set foldlevelstart=20
set colorcolumn=80
set tw=79
"set autoindent
hi Comment ctermfg=cyan guifg=cyan cterm=NONE

set cursorcolumn
hi CursorColumn ctermfg=Grey ctermbg=black cterm=underline guifg=white guibg=yellow gui=underline

set background=dark
if has("terminfo")
  set t_Co=8
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
else
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syn on

" se você tem um arquivo com uma extensão qualquer, como .xyz e quer que
" o vim o interprete como um arquivo HTML,  diga para o vim configurar o
" ft (FileType)  ao abrir um arquivo novo  (BufNewFile)  ou já existente
" (BufRead) com essa extensão.
"
au BufNewFile,BufRead *.conf        set ft=conf
au BufNewFile,BufRead *.ino         set ft=arduino
au BufNewFile,BufRead *.cls         set ft=tex
au BufNewFile,BufRead *.launch      set ft=xml
au BufNewFile,BufRead *.ts          set ft=typescript syntax=typescript
au BufNewFile,BufRead *.vtt         set ft=vtt syntax=vtt
au BufNewFile,BufRead *.toml        set ft=toml syntax=toml " FIXME necessary?
au BufNewFile,BufRead *.textgrid    set ft=praat syntax=praat
au BufNewFile,BufRead *.TextGrid    set ft=praat syntax=praat
au BufNewFile,BufRead *.csv         set tw=0
au BufNewFile,BufRead *.html        set autoindent
" ou ainda,  se for um arquivo  de um tipo  já reconhecido pelo vim, use
" diretamente a opção FileType. 
"
au FileType python  set foldmethod=indent foldnestmax=6 autoindent
au FileType python  hi pythonString ctermfg=darkgreen
au FileType html    set tw=0 ts=2 sw=2 autoindent
au FileType bib     set tw=0
au FileType praat   set foldmethod=indent foldnestmax=6 autoindent
au FileType tex     set spell autoindent
au FileType tex     syntax spell toplevel

"au FileType markdown call SyntaxRange#Include('<!--begin=html-->','<!--end=html-->','html')

set expandtab

"https://superuser.com/questions/208177/vim-and-tex-filetypes-plaintex-vs-tex
let g:tex_flavor = "latex"

" https://vi.stackexchange.com/questions/5851/how-to-disable-arrow-keys-in-vim
noremap  <Left> :echo "no left for you"<CR>
vnoremap <Left> :<C-u>echo "no left for you"<CR>
inoremap <Left> <C-o>:echo "no left for you"<CR>

noremap  <Right> :echo "no right for you"<CR>
vnoremap <Right> :<C-u>echo "no right for you"<CR>
inoremap <Right> <C-o>:echo "no right for you"<CR>

noremap  <Up> :echo "no up for you"<CR>
vnoremap <Up> :<C-u>echo "no up for you"<CR>
inoremap <Up> <C-o>:echo "no up for you"<CR>

noremap  <Down> :echo "no down for you"<CR>
vnoremap <Down> :<C-u>echo "no down for you"<CR>
inoremap <Down> <C-o>:echo "no down for you"<CR>

set diffopt+=iwhite
if &diff
    set colorcolumn=0
endif

"" https://stackoverflow.com/questions/15904758/how-can-i-make-vim-show-spaces
"let g:indentLine_leadingSpaceChar='·'
"let g:indentLine_leadingSpaceEnabled='1'

syntax enable " CB: neovim

"" CB: vimpyter
"autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
"autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
"autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>
