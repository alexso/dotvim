call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"autocmd vimenter * NERDTree "Automatically start nerdtree at startup
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "Close vim if only window left is nerdtree

set nocompatible 								" stops vim from behaving in a strongly vi -compatible way
syntax on 											" Enables vim's syntax highlighting
set tabstop=2 									" tab is 2 spaces
set autoindent 									" Autoindent lines
color ron 											" Colorscheme ron

""Searching
set hlsearch 										" highlight search hits
set incsearch 									" updates search for ever keypress
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
nnoremap <CR> :noh<CR><CR>      " This unsets the last search pattern register by hitting return

"userinterface
set number 											" Show line number
set showmatch										" Show matching bracets when text indicator is over them
set ruler												" Always show current position
set cmdheight=2									" The commandbar height
set ls=2												" Always show filename
set visualbell t_vb=            " No bell!
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.DS_Store
set cursorline
set scrolloff=3                 " minimum lines to keep above and below cursor

"Map F2 to Toggle NerdTree plugin
map <F2> :NERDTreeToggle<CR> 

"Map F3 to Toggle Tagbar plugin
"nnoremap <silent> <F3> :TagbarToggle<CR> 
nnoremap <silent> <F3> :TlistToggle<CR>

"Map F4 to toggle pastemode in insert mode
set pastetoggle=<F4> 
"Map ; to : so ; can be used instead
nnoremap ; : 

"Toggle line number
:nmap <C-N><C-N> :set invnumber<CR>

"Shortcut to auto indent entire file
:nmap <F11> 1G=G
:imap <F11> <ESC>1G=Ga

"Look for tags in current directory and parent(recursive)
set tags=./tags

"sort taglist on name
let Tlist_Sort_Type = "name" 
let Tlist_Show_Menu = 1
let Tlist_Use_Right_Window = 1 		" Put taglist on the right side
let Tlist_Show_One_File = 1 			" Show only tags for the current file

filetype on 											" Detect file type
"A.vim plugin. ctrl-tab toggle header/source
map <C-tab> :A<CR> 								
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <F6> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
	\:cs reset<CR>
" F8 Run ctags
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> 
nmap t% :tabedit %<CR>
nmap td :tabclose<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <leader>f :CtrlP<cr>
let g:cfind = 'find %s -type f'
"let g:EasyMotion_leader_key = '<Leader>'

