"autocmd vimenter * NERDTree "Automatically start nerdtree at startup
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "Close vim if only window left is nerdtree
set nocompatible 								" stops vim from behaving in a strongly vi -compatible way
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"My bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'xolox/vim-easytags'
Bundle 'vim-scripts/TagHighlight'
"Bundle 'spf13/PIV'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'Townk/vim-autoclose'
"Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/ZoomWin'
Bundle 'bronson/vim-visual-star-search'
Bundle 'Lokaltog/powerline'
Bundle 'gregsexton/gitv'
Bundle 'ervandew/supertab'
Bundle 'chazy/cscope_maps'

filetype plugin indent on
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
" better ESC
inoremap jk <Esc>

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

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" For when you forget to sudo.. Really Write the file.
ca w!! w !sudo tee "%"

"Map F2 to Toggle NerdTree plugin
map <F2> :NERDTreeTabsToggle<CR> 

"Map F3 to Toggle Tagbar plugin
"sdfnnoremap <silent> <F3> :TagbarToggle<CR> 
nnoremap <silent> <F3> :TagbarToggle<CR>

"Map F4 to toggle pastemode in insert mode
set pastetoggle=<F4> 
"Map ; to : so ; can be used instead
nnoremap ; : 

"Toggle line number
:nmap <C-N><C-N> :set invnumber<CR>

"Shortcut to auto indent entire file
:nmap <F11> 1G=G
:imap <F11> <ESC>1G=Ga

" Enable fancy mode 
let g:Powerline_symbols = 'fancy'   " Powerline
set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p]
"Look for tags in current directory and parent(recursive)
"set tags=./tags

"sort taglist on name
"let Tlist_Sort_Type = 
""name" 
"let Tlist_Show_Menu = 1
"let Tlist_Use_Right_Window = 1 		" Put taglist on the right side
"let Tlist_Show_One_File = 1 			" Show only tags for the current file

"Fix nerdtree doesn't work on non-UTF-8 machines
let g:NERDTreeDirArrows=0

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
" F5 Run ctags
"map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> 
nnoremap <silent> <F5> :UpdateTypesFile<CR>
"nmap t% :tabedit %<CR>
nmap td :tabclose<CR>
:nnoremap <F8> :buffers<CR>:buffer<Space>
nmap <leader>f :CtrlP<cr>
let g:cfind = 'find %s -type f'
"let g:EasyMotion_leader_key = '<Leader>'

"SQ save session and SO opens session in normal mode
nmap SQ :wa<CR>:mksession! ~/.vim/sessions/
nmap SO :wa<CR>:so ~/.vim/sessions/

 " neocomplcache {
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_max_list = 15
        let g:neocomplcache_force_overwrite_completefunc = 1

" SuperTab like snippets behavior.
        imap <silent><expr><TAB> neosnippet#expandable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                    \ "\<C-e>" : "\<TAB>")
        smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

" Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
                    \ 'default' : '',
                    \ 'vimshell' : $HOME.'/.vimshell_hist',
                    \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }

" Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns._ = '\h\w*'

" Plugin key-mappings.

" These two lines conflict with the default digraph mapping of <C-K>
" If you prefer that functionality, add
" let g:spf13_no_neosnippet_expand = 1
" in your .vimrc.bundles.local file

        if !exists('g:spf13_no_neosnippet_expand')
            imap <C-k> <Plug>(neosnippet_expand_or_jump)
            smap <C-k> <Plug>(neosnippet_expand_or_jump)
        endif

        inoremap <expr><C-g> neocomplcache#undo_completion()
        inoremap <expr><C-l> neocomplcache#complete_common_string()
        inoremap <expr><CR> neocomplcache#complete_common_string()

" <TAB>: completion.
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" <CR>: close popup
" <s-CR>: close popup and save indent.
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
        inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y> neocomplcache#close_popup()

" Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" Use honza's snippets.
        let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

" Enable neosnippet snipmate compatibility mode
        let g:neosnippet#enable_snipmate_compatibility = 1

" For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
        set completeopt-=preview
" }

 " Tabularize {
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" easytags {
"set tags=./tags;,$HOME/.vim/vimtags
"let g:easytags_always_enabled = 0
"let g:easytags_autorecurse = 0
"let g:easytags_file = '~/.vim/vimtags/easytags'
"let g:easytags_dynamic_files = 0
"let g:easytags_by_filetype = 
"~/.vim/vimtags/"
"let g:easytags_auto_highlight = 0
"let g:easytags_include_members = 1
" }
