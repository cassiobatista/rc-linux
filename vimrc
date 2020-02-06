"""""""""""""""""""""""""""""""""""""""""
"set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"
"Plugin 'previm/previm.git'
"let g:previm_open_cmd = 'google-chrome-stable'
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""

syntax on
"filetype plugin indent on

set viminfo='10,\"30,:20,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif
au! Syntax php3 so ~/.php3.vim

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

map ,d :r!date<cr>
      \:s/ \(...\) \(..\).*\(....\)$/, \2 de \1 de \3/<cr>
      \:nohl<cr>
" mapeando caracter para quando achar uma palavra 
" desmarcar, LEMBRAR O GMAIL
map 8n :nohl<cr>


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

set is hls scs  "opções espertas de busca
set sm             "oninício do bloco recém fechado
set sw=4           "ShiftWidth: número de colunas para o comando >
set ruler          "régua: mostra a posição do cursor
set shm=filmnrwxt  "SHortMessages: encurta as mensagem da régua
set wildmode=longest,list  "para completação do TAB igual ao bash
set number         "para mostrar o numero ao lado
set title
" barra de status
set statusline=%F%m%r%h%w\ [%Y][%l,%v][%p%%][%L]
set laststatus=2
"set cursorcolumn
set cursorline		"mostra a linha do cursor
set sm
set tabstop=4

"highlight CursorColumn ctermbg=white
hi CursorColumn ctermfg=Grey ctermbg=Grey cterm=underline guifg=white guibg=yellow gui=underline


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
au BufNewFile,BufRead *.conf set ft=conf
au BufNewFile,BufRead *.xyz set ft=html
au BufNewFile,BufRead *.ino set ft=arduino
au BufNewFile,BufRead *.cls set ft=tex
au BufNewFile,BufRead *.launch set ft=xml
" ou ainda,  se for um arquivo  de um tipo  já reconhecido pelo vim, use
" diretamente a opção FileType. vamos usar de exemplo a linguagem python
" onde os TABs indicam os blocos de comandos, então é legal `vê-los`.
"
" para isso definimos uma  regra rápida de sintaxe chamada `pythonTAB` e
" a ela associamos a cor azul. além disso definimos algumas opções com o
" comando set e  para fechar,  trocamos a cor  das "strings" para verde,
" porque aquele rosinha é muito palha. 
"
au FileType python syn match pythonTAB '\t\+'
au FileType python hi pythonTAB ctermbg=blue
au FileType python set ts=4 shiftwidth=4 tw=80 "noet expandtab " FIXME
au FileType python set foldmethod=indent foldnestmax=6 autoindent
au FileType python hi pythonString ctermfg=darkgreen

au FileType html set textwidth=0 autoindent tabstop=2
au FileType bib  set textwidth=0

set foldlevelstart=20
"Recarrega o vim
" quando fizer alguma alteração do .vimrc basta apertar a tecla <F12>
nmap <F12> :<C-u>source $HOME/.vimrc <BAR> echo "Vimrc recarregado!"<CR>

set colorcolumn=80
set textwidth=79
set shiftwidth=4
"set autoindent
hi Comment ctermfg=cyan  guifg=cyan cterm=NONE

"au FileType markdown call SyntaxRange#Include('<!--begin=html-->','<!--end=html-->','html')

au BufNewFile,BufRead *.textgrid set ft=praat syntax=praat
au BufNewFile,BufRead *.TextGrid set ft=praat syntax=praat
au FileType praat set foldmethod=indent foldnestmax=6 autoindent

au BufNewFile,BufRead *.csv set tw=0

au BufNewFile,BufRead *.vtt set ft=vtt syntax=vtt

au BufNewFile,BufRead *.tex set autoindent spell
au bufnewfile,bufread *.tex syntax spell toplevel

au BufNewFile,BufRead *.ts set ft=typescript syntax=typescript
au BufNewFile,BufRead *.toml set ft=toml syntax=toml

if &diff
	set colorcolumn=0
endif

set expandtab
