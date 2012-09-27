call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

autocmd vimenter * NERDTree "Automatically start nerdtree at startup
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "Close vim if only window left is nerdtree

set nocompatible "stops vim from behaving in a strongly vi -compatible way
syntax on "Enables vim's syntax highlighting
"colorscheme lucius
"set background=dark
set number "Show line number
set ic "Search ignore case
set tabstop=2 "tab is 2 spaces
set autoindent "Autoindent lines
set hlsearch "highlight search hits
set incsearch "updates search for ever keypress
color ron "Colorscheme ron

"Map F2 to Toggle NerdTree plugin
map <F2> :NERDTreeToggle<CR> 

"Map F3 to Toggle Tagbar plugin
"nnoremap <silent> <F3> :TagbarToggle<CR> 
nnoremap <silent> <F3> :TlistToggle<CR>

"Map F4 to toggle pastemode in insert mode
set pastetoggle=<F4> 
"Map ; to : so ; can be used instead
nnoremap ; : 

"Look for tags in current directory and parent(recursive)
set tags=./tags

"sort taglist on name
let Tlist_Sort_Type = "name" 
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1 "Put taglist on the right side
"Show only tags for the current file
let Tlist_Show_One_File = 1 

filetype on "Detect file type
map <C-tab> :A<CR> "A.vim plugin. ctrl-tab toggle header/source
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> ,/ :nohlsearch<CR> "It clears the search buffer when you press ,/
nmap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
	\:cs reset<CR>
" F8 Run ctags
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> 
nmap t% :tabedit %<CR>
nmap td :tabclose<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>
