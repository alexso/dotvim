call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

autocmd vimenter * NERDTree "Automatically start nerdtree at startup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "Close vim if only window left is nerdtree

set nocompatible
syntax on
"colorscheme lucius
"set background=dark
set number
set ic
set tabstop=2
set autoindent
set hlsearch
set incsearch
color ron
map <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :TlistToggle<CR>
set pastetoggle=<F4>
nnoremap ; :
"set tags=./tags;/
let Tlist_Sort_Type = "name"
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
filetype on
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> ,/ :nohlsearch<CR> "It clears the search buffer when you press ,/
nmap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
	\:cs reset<CR>
nmap t% :tabedit %<CR>
nmap td :tabclose<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>
