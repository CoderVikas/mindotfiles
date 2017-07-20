" vim: foldmethod=marker textwidth=80:
"
" Global runtime directory: /usr/local/Cellar/macvim/8.0-126/MacVim.app/Contents/Resources/vim/runtime
"
" Must Have Settings {{{
  if &compatible
    " already set by mvim global vimrc 
    set nocompatible              " vim-defaults better"
  endif
  set autoread                    " detect when a file is changed
" }}}

" Sensible Files, Directories and Histories {{{
    " setup directories if do not exist
    let vimDir = '$HOME/.vim'   " Put plugins and dictionaries
    let myundoDir = expand(vimDir . '/undodir')
    let mybackupDir = expand(vimDir . '/vim-tmp/backup')
    let myswapDir = expand(vimDir . '/vim-tmp/swap')
    let mylocalhistDir = expand(vimDir . '/localhistory')
    let myviminfodir = expand(vimDir . '/viminfo')

    " create dirs if not created already
    call system('mkdir -p ' . vimdir)
    call system('mkdir -p ' . myundodir)
    call system('mkdir -p ' . mybackupdir)
    call system('mkdir -p ' . myswapdir)
    call system('mkdir -p ' . mylocalhistdir)
    call system('mkdir -p ' . myviminfodir)

    " simply backup and swaps
    set backup
    set writebackup
    let &backupdir= mybackupdir . '//'
    set backupdir+=~/.vim-tmp/backup,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

    " swap files
    let &directory= myswapdir . '//'
    set directory+=~/.vim-tmp/swaps,~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

    " persistant undo
    if has('persistent_undo')
        let &undodir = myundodir . '//'
        set undofile
    endif
    set undolevels=1000            " how many undos
    set undoreload=10000           " number of lines to save for undo

    " ! - store global variable which are store ready
    " % - restore the buffer list (only for vim without file arguments)
    " ' - number of files to remember marks for:
    " n - viminfo filepath (previously was ~/.viminfo):
    set viminfo^=!,%,'1000
    set viminfo+=n~/.vim/viminfo/viminfo
    set history=1000                " lines of command, search and input (each) history

" }}}

" bells and visualbells {{{
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500
" }}}

" terminal, encoding, mouse {{{
    set ttyfast                     " not tested yet: faster redrawing
    set encoding=utf-8              " encoding used in buffers, registers, strings in expressions etc
    setglobal fileencoding=utf-8    " encoding used for writing files.
    "set fileencodings=ucs-bom,utf-8,default,latin1 "known file encodings for auto detection
    set termencoding=utf-8          " terminal encoding
    set lazyredraw                  " don't update the display while executing macros
    if has('mouse')
    set mouse=a
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
    end
    set title                       " set terminal title
    set laststatus=2                " always display the statusline in all windows using 2 lines
    set showtabline=2               " always display the tabline, even if there is only one tab
    set fillchars+=stl:\ ,stlnc:\   " for powerline ssbar
    set cmdheight=2                 " command bar height
    set showcmd                     " show typed command in ss bar
    set noshowmode                  " hide the default mode text (e.g. -- insert -- below the ssline)
" }}}

set confirm                     " get a dialog when :q, :w, or :wq fails
set hidden                      " remember undo after quitting; allow editing in multiple buffers
set esckeys                     " map missed escape sequences (enables keypad keys)
set magic                       " change the way backslashes are used in search patterns
set bs=indent,eol,start         " allow backspacing over everything in insert mode
set diffopt+=vertical           " vertical diff

" --- copying ---
" set clipboard=unnamed  " yank to * instead of "
" set guioptions+=a     " visual mode selection automatically copies to clipboard

" gui options - remove exta, useless button bar.
"set guioptions-=t
"set guioptions+=t


" editor settings {{{
    set number                      " show line numbers
    " set relativenumber              " show relative line numbers
    set scrolloff=7                 " lines of text around cursor when scrolling
    set showmatch                   " show matching bracket (briefly jump)
    set matchtime=3                 " how many tenths of a second to blink
    set matchpairs+=<:>             " specially for html
    set wildmenu                    " enhanced command line completion
    set wildmode=longest:list,full  " preferred setting complete commands
    " https://gist.github.com/nickpresta/a93588e4a7f3e16a1bc9
    set wildignore +=*.o,*.obj,*~,*.pyc "stuff to ignore when tab completing
    set wildignore +=*.a,*.o
    set wildignore +=*.obj,*.bak,*.exe
    set wildignore +=*.py[co],*.pyc
    set wildignore +=*.zip
    set wildignore +=*.so
    set wildignore +=*.swp
    set wildignore +=*/.svn/*
    set wildignore +=*/.git/*
    set wildignore +=*.ipc
    set wildignore +=target
    set wildignore +=project
    set wildignore +=lib_managed
    set wildignore +=_site
    set wildignore +=node_modules
    set wildignore +=cache
    set wildignore +=tmp
    set wildignore +=.env
    set wildignore +=.env[0-9]+
    set wildignore +=.git,.gitkeep
    set wildignore +=.tmp
    set wildignore +=.coverage
    set wildignore +=*ds_store*
    set wildignore +=.sass-cache/
    set wildignore +=__pycache__/
    set wildignore +=.webassets-cache/
    set wildignore +=vendor/rails/**
    set wildignore +=vendor/cache/**
    set wildignore +=*.gem
    set wildignore +=log/**
    set wildignore +=tmp/**
    set wildignore +=.tox/**
    set wildignore +=.idea/**
    set wildignore +=.vagrant/**
    set wildignore +=.coverage/**
    set wildignore +=*.egg,*.egg-info
    set wildignore +=*.png,*.jpg,*.gif
    set wildignore +=*.so,*.swp,*.zip,*/.trash/**,*.pdf,*.dmg,*/library/**,*/.rbenv/**
    set wildignore +=*/.nx/**,*.app
    set wildignore +=*.class,*.rbc
    set wildignore +=.hg,.git,.svn                    " version control
    set wildignore +=*.aux,*.out,*.toc                " latex intermediate files
    set wildignore +=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore +=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore +=*.spl                            " compiled spelling word lists
    set wildignore +=*.sw?                            " vim swap files
    set wildignore +=*.ds_store                       " osx bullshit
    set wildignore +=migrations                       " django migrations
    set wildignore +=*.pyc                            " python byte code
   
   
    " is the followed really needed ??
    set autochdir

    " editor settings
    set autoindent                  " automatically set indent of new line
    set smartindent                 " smart auto indenting
    
    set fileformats=unix,dos,mac     " file mode is unix
" }}}

" search settings {{{
    set ignorecase                  " case insensitive searching
    set smartcase                   " but become case sensitive if you type uppercase characters
    set hlsearch                    " highlight search (very useful!)
    set incsearch                   " search incremently (search while typing)
" }}}

" tab control settings {{{
    set expandtab                   " turn a tabs into spaces
    set smarttab                    " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4                   " the visible width of tabs
    set softtabstop=4               " edit as if the tabs are 4 characters wide
    set shiftwidth=4                " spaces for autoindents
    set shiftround                  " round indent to a multiple of 'shiftwidth'
" }}}

" wrap settings {{{
    set wrap                        " turn on line wrapping
    set linebreak                   " set soft wrapping
    "set colorcolumn=120             " vim to color column 120  
   
    " http://blog.ezyang.com/2010/03/vim-textwidth/
    "
    " http://vimcasts.org/episodes/soft-wrapping-text/
    " options for hardwrapping - tw and wm
    " set textwidth=200
    " set wrapmargin=8                " wrap lines when coming within n characters from side
    " set linebreak             " break lines at separators, not stupidly on textwidth
    set cpoptions+=n                 " only compatibility option to help with wraping
    " moving up and down work as you would expect
    " nnoremap <silent> j gj
    " nnoremap <silent> k gk
    " nnoremap <silent> ^ g^
    " nnoremap <silent> $ g$
    " map <c-up> g<up>
    " map <c-down> g<down>
    " imap <c-up> <c-[> g<up> i
    " imap <c-down> <c-[> g<down> i
" }}}

"set completeopt+=longest      " keep it disabled for now until supertab is tested
"set completeopt=longest,menu,preview      " keep it disabled for now until supertab is tested
"?? above??

" code folding settings {{{
    set foldmethod=syntax       " fold based on indent
    set foldnestmax=10          " deepest fold is 10 levels
    set nofoldenable            " don't fold by default
    set foldlevel=1
    "set foldlevelstart=20      " max. technically possible value for improved folding
" }}}

" use of the filetype plugins, auto completion and indentation support
filetype plugin indent on

" pending experiments {{{
    " this plugin not yet loaded in plugin file - test it later
    " let g:vlh_repository_dir = "/users/yadvika/.vim/localhistory"
" }}}

let g:python_host_prog = '/usr/local/bin/python'
let mapleader = "\\"
let maplocalleader = ","

" add ~/.vim directory to rtp
let &runtimepath.=','.vimdir
source ~/.vim/custom/vim-abbr.vim
source ~/.vim/custom/vim-plugins.vim

" remap whitespace listchars {{{
    set list
    "set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    set showbreak=↪
    "let &showbreak='↪ '
    " set showbreak=…             " show ellipsis at breaking
" }}}

" custom shortcuts {{{
  " convenient mapping : recursive map space to leader
  " my leader is \ above and localleader is ,
  " localleader is , which is easy - no further remap needed
  map <space> <leader>

  " fast esc map - from ii
  " press i to enter insert mode, ii to exit
  imap ii <esc>
  
  " conflict with control-space
  " nnoremap <c-space> i
  " <c-space> <esc>
  
  " try ; to :
  noremap ; :
  
  " most common operation - save the buffer
  nnoremap <leader><space> :w<cr>
  " one more shortcut to save
  nnoremap <leader>, :w<cr>
  
  " from vim-sensible
  " " ctrl-u in insert mode deletes a lot.  use ctrl-g u to first break undo,
  " " so that you can undo ctrl-u after inserting a line break.
  " inoremap <c-u> <c-g>u<c-u>

  " wipeout buffer
  nnoremap <silent> <leader>b :bw<cr>
  
  " paste toggler
  set pastetoggle=<leader>v
  
  " edit ~/.vimrc
  map <leader>ev :e! ~/.vimrc<cr>
  " edit ~/.tmux.conf
  map <leader>et :e! ~/.tmux.conf<cr>
  " edit ~/.vimrc
  map <leader>ez :e! ~/.zshrc<cr>
 
  " clear highlighted search
  noremap <leader>h :set hlsearch! hlsearch?<cr>
  
  " --- remove highlights via <esc> ---
  " remapped already - need to fix it
  " nnoremap <esc> :noh<cr><esc>
  
  " not working for me
  " activate spell-checking alternatives
  nmap ;s :set invspell spelllang=en<cr>
  
  " build
  nmap <leader>bb :!buildbuild<cr>
  
  " remove extra whitespace
  nmap <leader>s :%s/\s\+$<cr>
  
  nmap <leader>l :set list!<cr>
  
  " textmate style indentation
  vmap <leader>[ <gv
  vmap <leader>] >gv
  nmap <leader>[ <<
  nmap <leader>] >>
  
  " --- indenting stuff: use tab and/or > ---
  " (highlighting single characters, too hard to fix, so what)
  " vnoremap > >gv
  " vnoremap < <gv
  " vmap <tab> >
  " vmap <s-tab> <
  
  " switch between current and last buffer
  nmap <leader>. <c-^>
  
  " enable . command in visual mode
  vnoremap . :normal .<cr>
 
  " this will sorted out later - conflicts with tmux
  " map <silent> <leader><c-h> :call functions#winmove('h')<cr>
  " map <silent> <leader><c-j> :call functions#winmove('j')<cr>
  " map <silent> <leader><c-k> :call functions#winmove('k')<cr>
  " map <silent> <leader><c-l> :call functions#winmove('l')<cr>
  " inoremap <tab> <c-r>=smart_tabcomplete()<cr>
  " map <leader>r :call runcustomcommand()<cr>
  " let g:silent_custom_command = 0
  
  " toggle cursor line
  nnoremap <leader>i :set cursorline!<cr>
  
  " scroll the viewport faster
  nnoremap <c-e> 3<c-e>
  nnoremap <c-y> 3<c-y>
  
  " search for word under the cursor
  nnoremap <leader>/ "fyiw :/<c-r>f<cr>
  
  " convenient command to see the difference between the current buffer and the
  " file it was loaded from, thus the changes you made.
  " only define it when not defined already.
  " if !exists(":difforig")
  "  command difforig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
  " endif

  " tab related
  " map -> n,v,o (normal, visual+select, operator)
  " map! -> i, c (insert and command-line)
  " http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
  " map <leader>( <esc>:tabprevious<cr>
  " map <leader>) <esc>:tabnext<cr>
  " map <leader>t <esc>:tabnew<cr>
  " nmap <leader>( :tabprevious<cr>
  " nmap <leader>) :tabnext<cr>
  " nmap <leader>t :tabnew<cr>
  "imap <leader>t <esc>:tabnew<cr>
" }}}

" pane management {{{
  " open new split panes to right and bottom, which feels more natural than vim’s default:
  set splitbelow
  set splitright
  " nnoremap <c-n> :bnext<cr>
" }}}

" custom autogroups {{{
  " #1 markdown solution
  " marked 2 - works well but $14
  function! s:setupmarkup()
    nnoremap <buffer> <localleader>mpre :w<cr>:silent! !open -a 'marked 2.app' '%:p' &<cr>:redraw!<cr>
  endfunction
  " #********2 markdown solution with special chrome extension
  " works well with css and autoload - free
  function! s:setupchromemarkup()
    nnoremap <buffer> <localleader>cpre :w<cr>:silent! !open -a '/applications/google chrome.app/contents/macos/google chrome' '%:p' &<cr>:redraw!<cr>
    "au filetype markdown noremap <buffer> <localleader>cpre :w<cr>:silent! !chrome %:p &<cr>:redraw!<cr>
  endfunction
  " #3 markdown solution with macdown
  " css but no autoreload. waiting for improvement.
  function! s:setupmacdownmarkup()
    nnoremap <buffer> <localleader>pre :w<cr>:silent! !open -a macdown '%:p' > /dev/null &<cr>:redraw!<cr>
  endfunction
  " #4 markdown solution with macoff
  " css not well. but good autoreload. waiting for improvement.
  function! s:setupmacoffmarkup()
    nnoremap <buffer> <localleader>opre :w<cr>:silent! !open -a macoff '%:p' > /dev/null &<cr>:redraw!<cr>
  endfunction
  " #*******5 vim-markdown-preview with pandoc
  " my changes. worked with css and autosave
  " see bufwritepost hook below
  " with let vim_markdown_preview_toggle=2
  " #6 - atom markdown preview plus.
  " copy paste does not work with this. whole html format get coppied.
  " from thkeep the file open in atom and c-s-m to open preview in a tab.
  " this has css and autoread. separate app and works well.
  " markdown highlighting {{{
    au bufnewfile,bufread,bufwrite *.md syntax match comment /\%^---\_.\{-}---$/
    " au filetype markdown setlocal textwidth=100
    " open markdown files with chrome.
    au filetype markdown call s:setupmacdownmarkup() 
    au filetype markdown call s:setupmacoffmarkup() 
    au filetype markdown call s:setupchromemarkup() 
    au filetype markdown call s:setupmarkup()
  " }}}
  " diff highlighting {{{
    " augroup patchdiffhighlight
    "     autocmd!
    "     autocmd bufenter *.patch,*.rej,*.diff syntax enable
    " augroup end
    " or
    "filetype on
    "augroup patchdiffhighlight
        " autocmd!
        " autocmd filetype diff syntax enable
    " augroup end
  " }}}
  " auto pane resizing {{{
    augroup resizepanebuffers
        autocmd!
        " automatically resize panes on resize
        autocmd vimresized * wincmd =
        
    augroup end
  " }}}
  " autosave on focus events {{{
    augroup autosavebuffers
      autocmd!
      " save all files on focus lost, ignoring warnings about untitled buffers
      "----autocmd focuslost * silent! :wa
      " autocmd focuslost * :set invrelativenumber 
    augroup end
  " }}}
  " last location restore {{{
    augroup lastlocation
      autocmd!
      " when editing a file, always jump to the last known cursor position.
      autocmd bufreadpost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
    augroup end
  " }}}
  " auto config reload {{{
    augroup configfiles
      autocmd!
      " for later
      " autocmd bufwritepost .vimrc,.vimrc.local,init.vim source %
    augroup end
  " }}}
  " auto filetype config {{{
    augroup filetypeauto 
      autocmd!
      " make quickfix windows take all the lower section of the screen
      " when there are multiple windows open
      autocmd filetype qf wincmd j
      " for all plain text files set 'textwidth' to 78 characters.
      autocmd filetype text setlocal textwidth=78
      
      " --- highlight settings ---
      autocmd insertleave * set nocul   " highlight current line when in insert mode
      autocmd insertenter * set cul     " unhighlight current line when not in insert mode
      
      " --- don't auto-complete comments ---
      " autocmd filetype * setlocal fo-=cro
      
      " --- code folding ---
      " auto-define folds but unfold them on startup
      "autocmd syntax * setlocal foldmethod=syntax
      "autocmd syntax * normal zr
      " code folding via space when the file has folds
      "autocmd syntax * nnoremap <silent> <space> @=(foldlevel('.')?'za':'l')<cr>
      " --- no wrapping for all but plain text files ---
      " autocmd syntax * setlocal nowrap
      
      " --- no auto-indentation for html files ---
      autocmd filetype html set noautoindent indentexpr=
    augroup end
  " }}}
  " auto newfile config {{{
    " augroup newfile 
    "   au!
    "   autocmd bufnewfile            *.html  0r      ~/templates/html4.html
    "   autocmd bufnewfile            *.xhtml 0r      ~/templates/xhtml.xhtml
    "   autocmd bufnewfile            *.c     0r      ~/templates/c.c
    "   autocmd bufnewfile            *.py    0r      ~/templates/python.py
    "   autocmd bufnewfile            *.js    0r      ~/templates/javascript.js
    "   autocmd bufnewfile            *.txt   0r      ~/templates/rst.rst
    "   autocmd bufnewfile            *.rst   0r      ~/templates/rst.rst
    " augroup end
  " }}}
" }}}

" custom settings for plugins {{{
" indentline {{{
  " vertical line indentation
  let g:indentline_color_term = 239
  let g:indentline_color_gui = '#09aa08'
  let g:indentline_char = '│'
" }}}
" autopair {{{
  " vertical line indentation
  let g:autopairsmapspace = 0
" }}}
" eclim {{{
  "let g:eclimfiletypevalidate = 0
  "
  "
  "http://valloric.github.io/youcompleteme/  - search eclim on this page
  let g:eclimcompletionmethod = 'omnifunc'
  " following http://eclim.org/gettingstarted.html
  " to create first empty project
  " :projectcreate /users/yadvika/eclimprojects/myfirstproject -n java
  " :projectlist
  "
  " http://stackoverflow.com/questions/34762391/eclim-classpath-commands-newsrcentry-not-recognized
  " https://github.com/ervandew/eclim/issues/433
  " 
  " when i followed this it worked just fine: following http://eclim.org/gettingstarted.html
  " 
" }}}
" unimpaired {{{
  " types :help unimpaired
  "
  " full set of 20 mappings and mnemonics. all of them take a count.
  " ]q is :cnext.
  " [q is :cprevious.
  " ]a is :next.
  " [b is :bprevious. 

  " linewise mappings.
  " [<space> and ]<space> add newlines before and after the cursor line.
  " [e and ]e exchange the current line with the one above or below it.

  " toggling options mappings
  " [os, ]os, and cos perform :set spell, :set nospell, and :set invspell, respectively.
  " l (list), n (number), w (wrap), x (cursorline cursorcolumn),
  " and several others, plus mappings to help alleviate the set paste dance.

  " mappings for encoding and decoding. 
  " [x and ]x encode and decode xml (and html).
  " [u and ]u encode and decode urls.
  " [y and ]y do c string style escaping.

  " miscellaneous category, there's
  " [f and ]f to go to the next/previous file in the directory, 
  " and [n and ]n to jump between scm conflict markers.

  " the . command works with all operator mappings, and will work with
  " the linewise mappings as well (with repeat.vim installed).
" }}} 
" gundo {{{
  nmap <leader>gu :gundotoggle<cr>
" }}}
" vim markdown preview {{{
  let vim_markdown_preview_hotkey='<c-m>'
  let vim_markdown_preview_browser='google chrome'
  let vim_markdown_preview_pandoc=1
  let vim_markdown_preview_pandoc_css_theme='solarizeddark'
  let vim_markdown_preview_toggle=3
  " not good rendering 
" }}}
" vim instant markdown {{{
  let g:instant_markdown_autostart = 0
  " explicitly do :instantmarkdownpreview
" }}}
" goyo {{{
  nmap <leader>goy :goyo<cr>
" }}}
" bookmarks {{{
  let g:bookmark_no_default_key_mappings = 1
" }}}
" markdown tpope {{{
  let g:markdown_fenced_languages = ['javascript', 'ruby', 'sh', 'yaml', 'javascript', 'html', 'vim', 'coffee', 'json', 'diff', 'java']
" }}}
" nerdtree {{{
  let nerdtreeshowhidden=1
  let nerdtreedirarrowexpandable = '▷'
  let nerdtreedirarrowcollapsible = '▼'

  " toggle nerdtree
  " nmap <silent> <leader>k :nerdtreetoggle<cr>
  " expand to the path of the file in the current buffer
  " nmap <silent> <leader>y :nerdtreefind<cr>
" }}} 
" tabman {{{
  "<leader>mt or run :tmtoggle to toggle tabman.
  "<leader>mf or run :tmfocus to give focus to/open the tabman window.
" }}}
" ultisnips {{{
  "
" }}} 
" ctrlp {{{
  " easyclip has taken c-p. use c-t for ctrlp.
  let g:ctrlp_map = '<c-t>'
  let g:ctrlp_cmd = 'ctrlp'
  let g:ctrlp_clear_cache_on_exit = 0
" }}} 
" fzf {{{
  " refer docs and source for options
  let g:fzf_layout = { 'down': '~25%' }

  if isdirectory(".git")
      " if in a git project, use :gfiles
      " nmap <silent> <leader>t :gfiles<cr>
  else
      " otherwise, use :fzf
      " nmap <silent> <leader>t :fzf<cr>
  endif

  " nmap <silent> <leader>r :buffers<cr>
  " nmap <silent> <leader>e :fzf<cr>
  " nmap <leader><tab> <plug>(fzf-maps-n)
  " xmap <leader><tab> <plug>(fzf-maps-x)
  " omap <leader><tab> <plug>(fzf-maps-o)

  " insert mode completion
  " imap <c-x><c-k> <plug>(fzf-complete-word)
  " imap <c-x><c-f> <plug>(fzf-complete-path)
  " imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  " imap <c-x><c-l> <plug>(fzf-complete-line)

  " nnoremap <silent> <leader>c :call fzf#run({
  " \   'source':
  " \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
  " \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
  " \   'sink':    'colo',
  " \   'options': '+m',
  " \   'left':    30
  " \ })<cr>

  " command! fzfmru call fzf#run({
  " \  'source':  v:oldfiles,
  " \  'sink':    'e',
  " \  'options': '-m -x +s',
  " \  'down':    '40%'})

" }}}
" fugitive {{{
  nmap <silent> <leader>gs :gss<cr>
  nmap <leader>ge :gedit<cr>
  nmap <silent><leader>gr :gread<cr>
  nmap <silent><leader>gb :gblame<cr>
" }}}
" vim-json {{{
  " don't hide quotes in json files
  let g:vim_json_syntax_conceal = 0
" }}}
" supertab - {{{
  " is this needed before plugin init? 
  let g:supertabcrmapping = 0
" }}}
" hyperterm and iterm2 focus gain/lossmanagement {{{
  let g:vitality_always_assume_iterm = 1
" }}}
" number display toggle {{{
  function! numbertoggle()
    if(&relativenumber == 1)
      set number
    else
      set relativenumber
    endif
  endfunc
  nnoremap <leader>nu :call numbertoggle()<cr>
  " augroup autonumbering
  "     autocmd!
  "     autocmd focuslost * :set number
  "     autocmd focusgained * :set relativenumber
  "     autocmd insertenter * :set number
  "     autocmd insertleave * :set relativenumber
  " augroup end
" }}}
" vim easy clip - remap gm to m {{{
  nnoremap gm m
" }}}
" tmux navigation with my clip solution {{{
  " now my new registercopytotmux is not being used.
  " i used vim8,nvim timer to delay focusgained event for vim_tmux_clipboard by
  " 50 ms. this makes sure the race condition is solved and two vim sessions
  " side by side can behave as if sharing same session.
  "
  " a hot-key to enable-disable vim-tmux copy back and forth.
  "
  noremap <leader>tmux :vimtmuxtoggle<cr>
  " tmux settings
  " c-a c-c to copy tmux saved buffer to clipboard
  " c-a c-v for paste from system clipboard
  " c-a ] for paste from system clipboard.
  "
  " vim focusgain/loss will copy into out of vim @" register to 
  " tmux clipboard.
  " use above hotkey to disable this automatic copy."
  "  my tmux setting are copy into system clipboard.
  "
  "  tmux list-keys -t vi-copy | egrep 'pbcopy|paste|load'
  " bind-key -t vi-copy             enter copy-pipe "pbcopy"
  " bind-key -t vi-copy                 ! copy-pipe "tr -d '\n' | pbcopy"
  " bind-key -t vi-copy                 y copy-pipe "tmux paste-buffer"
  " bind-key -t vi-copy                 y copy-pipe "pbcopy"
  " bind-key -t vi-copy mousedragend1pane copy-pipe "pbcopy"
  " bind-key -t vi-copy               m-y copy-pipe "pbcopy; tmux paste-buffer"
  "
  " in my case c-a p (and c-a y)  is only mapping which paste from tmux buffer
  " other mapping are copyiing to and from system. wait a minute
  " pbcopy does copy to both sysem clipboard and tmux buffer.
  "
  " c-a c-c can help with moving non copied buffer to system (in case of vim
  " editing)
  "
  " ! mapping in vi-copy mode copies non-empty lines to system clipboard.
  "
  "
  " this one will stop my plugin for registercopytotmux to be disabled at
  " starttime. this is only for my plugin in ~/.vim/plugin/...
  let g:vim_tmux_clip_disabled = 1"
  "  
  " let g:tmux_navigator_no_mappings = 1
  " nnoremap <silent> <c-h> :registercopytotmux<cr> \| :tmuxnavigateleft<cr>
  " nnoremap <silent> <c-j> :registercopytotmux<cr> \| :tmuxnavigatedown<cr>
  " nnoremap <silent> <c-k> :registercopytotmux<cr> \| :tmuxnavigateup<cr>
  " nnoremap <silent> <c-l> :registercopytotmux<cr> \| :tmuxnavigateright<cr>
  " nnoremap <silent> <c-\> :registercopytotmux<cr> \| :tmuxnavigateprevious<cr>
  " tmux-yank plugin
  "
  " prefix + y for copy text from command line into clipboard
  " prefix + y for cwd of pane into clipboard
  "
  " in copy-mode - just y for selection to clipboard.
  " in copy-mode - just y paste selection to command prompt.
" }}}
" }}}

" color, font and theme {{{
  if &term =~ '256color'
      " turn these back on under tmux if needed
      " set t_ut=
      " in term it is 256 already. turn is back on if needed.
      " set t_co=256
  endif

  " powerline hook
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
  set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
  "set rtp+='$home/.vim/plugin/hammer.vim'

  " font
  if ( has('mac') )
      if has('gui_running')
        set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h11
      else
        set guifont=Menlo\ for\ Powerline:h14
      endif
  endif

  " colorscheme
  let g:onedark_termcolors=16
  let g:onedark_terminal_italics=1
  if has('gui_running')
      set background=light
      colorscheme solarized
  else 
      set background=dark
      colorscheme solarized
  endif
  syntax enable                   " syntax enable is better than syntax on
" }}}

" Terminal Color and Highlights {{{
  set cursorline
  " :help group-name for various groups
  
  " highlighting of tabs and other non-text less annoying
  highlight SpecialKey ctermbg=none ctermfg=8
  highlight NonText ctermbg=none ctermfg=8

  " make comments italic
  " let &t_ZH="\e[3m"
  " let &t_ZR="\e[23m"
  highlight Comment cterm=italic
  highlight htmlArg cterm=italic
  highlight LineNr cterm=italic
  highlight CursorLineNr cterm=bold,italic ctermfg=2

  " highlight conflicts
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" }}}

" Better Vim {{{
  " only works after colorscheme
  highlight ColorColumn ctermbg=magenta
  call matchadd('ColorColumn', '\%121v', 100)
" }}}

" Local system overrides {{{
  if filereadable($HOME . "/.vimrc.local")
    execute "source " . $HOME . "/.vimrc.local"
  endif
" }}}

" hlnext download from Damian Conway link (blinking one is good)
" look at his automatic swap file switch - readonly and management in safe way.
" better distraction free editing.
" listrans in his tarball.
" setup a limited engilish dictionary to make documentation effective.
" vim space bind the latest motion you made to space or backspace key.
"
" integrate tag building with git commit
" http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
" https://robots.thoughtbot.com/use-git-hooks-to-automate-annoying-tasks
" .git_template for new projects
"
"
" running commands in chain - also  using execute to run command in different
" mode
" :execute 'normal "ayiw' | echo @a
" <bar> and | are same.
"
" Solution to Space highlighting.
"
" Search  Pattern
" " Show all tabs:
" /\t
" Show trailing whitespace:
" /\s\+$
" Show trailing whitespace only after some text (ignores blank lines):
" /\S\zs\s\+$
 " Show spaces before a tab:
" / \+\ze\t

" Match command highlighting
"
">>>> highlight ExtraWhitespace ctermbg=red guibg=red
" The following alternative may be less obtrusive.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Try the following if your GUI uses a dark background.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen


" the following in ensure that future  ColorScheme command will not
" overwrite my setting
">>>> autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" now 4 patterns
"
" " Show trailing whitespace:
" :match ExtraWhitespace /\s\+$/

" Show trailing whitespace and spaces before a tab:
" :match ExtraWhitespace /\s\+$\| \+\ze\t/

" Show tabs that are not at the start of a line:
" :match ExtraWhitespace /[^\t]\zs\t\+/

" Show spaces used for indenting (so you use only tabs for indenting).
" :match ExtraWhitespace /^\t*\zs \+/

":match ExtraWhitespace /\S\zs\s\+$/
" Switch off :match highlighting.
" :match
"
"
"
"
"  Summary
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()
"
"
"
"
" set list listchars=tab:»·,trail:·
" :set list listchars=tab:>-,trail:.,extends:>
" Enter the middle-dot by pressing Ctrl-k then .M
":set list listchars=tab:\|_,trail:·
" Enter the right-angle-quote by pressing Ctrl-k then >>
":set list listchars=tab:»·,trail:·
" Enter the Pilcrow mark by pressing Ctrl-k then PI
":set list listchars=tab:>-,eol:¶
" The command :dig displays other digraphs you can use.
"
"
"
":match ExtraWhitespace /\s\+\%#\@<!$/

" this is for strictly trailing space
":match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
" If you use this alternate pattern, you may want to consider using the following autocmd to let the highlighting show up as soon as you leave insert mode after entering trailing whitespace:

":autocmd InsertLeave * redraw!
"Or alternatively, the following can be used:
":au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
":au InsertLeave * match ExtraWhitespace /\s\+$/
"
"
" highlight ExtraWhitespace ctermbg=red guibg=red

" disable all of this now
" augroup WhitespaceMatch
"   " Remove ALL autocommands for the WhitespaceMatch group.
"   autocmd!
"   " autocmd BufWinEnter * let w:whitespace_match_number =
"   "       \ matchadd('ExtraWhitespace', '\s\+$')
"   autocmd BufWinEnter * let w:whitespace_match_number =
"         \ matchadd('ExtraWhitespace', '\S\zs\s\+$')
"   autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
"   autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
" augroup END
" function! s:ToggleWhitespaceMatch(mode)
"   " let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
"   let pattern = (a:mode == 'i') ? '\S\zs\s\+\%#\@<!$' : '\S\zs\s\+$'
"   if exists('w:whitespace_match_number')
"     call matchdelete(w:whitespace_match_number)
"     call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
"   else
"     " Something went wrong, try to be graceful.
"     let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
"   endif
" endfunction
":highlight ExtraWhitespace ctermbg=red guibg=red
"
"
"Links
"
"http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
"http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"i
"
"
"
"
" Syntastic and CheckStyle
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_python_flake8_args = "--ignore=E501"

" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
" let g:syntastic_cpp_check_header = 1
" let g:syntastic_cpp_clang_tidy_post_args = ""

" let g:syntastic_java_checker = "checkstyle"
" let g:syntastic_java_checkstyle_classpath = "/Users/junon/Applications/Eclipse.app/Contents/Eclipse/plugins/org.eclim.jdt_2.5.0/lib/checkstyle-6.17-all.jar"
" let g:syntastic_java_checkstyle_conf_file = ".checkstyle.xml"

"let g:syntastic_java_checker = "checkstyle"
let g:syntastic_java_checkers = [ "checkstyle" , "javac" ]
let g:syntastic_java_checkstyle_classpath = "/usr/local/Cellar/checkstyle/7.6/libexec/checkstyle-7.6-all.jar"
" /Users/junon/Applications/Eclipse.app/Contents/Eclipse/plugins/org.eclim.jdt_2.5.0/lib/checkstyle-6.17-all.jar"
let g:syntastic_java_checkstyle_conf_file = '~/.config/checkstyle/google_checks.xml'

"
"
"
"
"
"Snippets and YCM
"
"  https://github.com/wincent/wincent/commit/0664b627e7390c7ab5b047ee5818801481d0f46c#diff-2814bef6a79f3b26ed00857d73175745
"
"
"  So, I'm using YouCompleteMe everywhere now, not just on my Mac, so I am
" expecting to be doing a lot more autocompletion from here on. Time to
" fix some long-held grievances I have with the way autocompletion is
" working with UltiSnips, YouCompleteMe and Supertab.

" Here's an example scenario.

" I have a snippet `log` that expands to `console.log();`, with a
" placeholder inside the parens. Now, say I have a file with:

"    var fooBar = 1;

" and I type:

"     log<tab>

" UltiSnips puts me here:

"     console.log(|);
"                 ^
"                 (cursor here)

" If I then type:

"     console.log(fooB<tab>);

" I wind up here:

"     console.log(fooB);|
"                       ^
"                       (cursor here)

" When what I really want is:

"     console.log(fooBar|);
"                       ^
"                       (cursor here)

" ie. if Supertab _can_ complete something, I want it to, otherwise I want
" UltiSnips to get the tab.

" With YouCompleteMe in the picture, the experience is even worse, because
" you'll see the pop-up as soon as you start typing "fooB". Reflexively,
" you'd think you could push `<Tab>` to expand the suggestion, but you
" can't; you have to remember to push `<C-j>` or `<C-n>` or `<Down>` (ugh)
" instead.


"
" Note: iterm does not sent <C-tab> need a different
" mapping than C-tab for snippet list
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" let g:UltiSnipsExpandTrigger="<c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" YCM guys's config
" UltiSnips triggering
" let g:UltiSnipsExpandTrigger = '<C-j>'
" let g:UltiSnipsJumpForwardTrigger = '<C-j>'
" let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/22253548#22253548

"https://github.com/Valloric/YouCompleteMe/issues/420
" function! g:UltiSnips_Complete()
"     call UltiSnips_ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips_JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction

" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" func! g:jInYCM()
"     if pumvisible()
"         return "\<C-n>"
"     else
"         return "\<c-j>"
" endfunction

" func! g:kInYCM()
"     if pumvisible()
"         return "\<C-p>"
"     else
"         return "\<c-k>"
" endfunction
" inoremap <c-j> <c-r>=g:jInYCM()<cr>
" au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:kInYCM()<cr>"

" YCM
" ------
" let g:ycm_complete_in_comments = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_global_ycm_extra_conf=expand('~/.vim/ycm_extra_conf.py')
" let g:ycm_register_as_syntastic_checker = 1
" let g:ycm_seed_identifiers_with_syntax=1
" let g:ycm_collect_identifiers_from_tags_files=1

"https://vimeo.com/vimlondon/videos/sort:plays/format:thumbnail
" C-k, C-k for both of ultisnip bindings
"let g:UltiSnipsExpandTrigger       = "<c-k>"
"let g:UltiSnipsJumpForwardTrigger  = "<c-k>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-c-k>"

" https://github.com/SirVer/ultisnips/issues/233
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsSnippetsDir = "~/config/UltiSnips"
" let g:UltiSnipsSnippetDirectories=["~/config/UltiSnips"]


"let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
"let g:UltiSnipsSnippetsDir = "~/project/dotfiles/.vim/snips"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
" let g:UltiSnipsEditSplit= "context"
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" https://github.com/SirVer/ultisnips/issues/649
" https://github.com/SirVer/ultisnips/issues/264
"
"
"
"echo &omnifunc
" htmlcomplete#CompleteTags
" https://github.com/Valloric/YouCompleteMe/issues/1214


" https://github.com/wincent/wincent/commit/0664b627e7390c7ab5b047ee5818801481d0f46c#diff-f265ec80eacfdffc599e80daa3dcf55d
"



" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsListSnippets="<c-f>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"


let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Enable tabbing through list of results
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>


" @zefdoran
" https://github.com/Valloric/YouCompleteMe/issues/36
"
"
" current vim env
" http://vim.wikia.com/wiki/Displaying_the_current_Vim_environment

" Another method
 " "" Ultisnips Snippet Track the engine.
 " Bundle 'SirVer/ultisnips'
 " " Snippets are separated from the engine. Add this if you want them:
 " Bundle 'honza/vim-snippets'
 " " Trigger configuration. Do not use <tab> if you use YouCompleteMe
 " let g:ycm_key_list_previous_completion=['<Up>']
 " let g:UltiSnipsExpandTrigger="<c-e>"
 " let g:UltiSnipsListSnippets="<c-l>"
 " " If you want :UltiSnipsEdit to split your window.
 " let g:UltiSnipsEditSplit="vertical""
" https://github.com/Valloric/YouCompleteMe/issues/36
"
" It’s better to make YCM not use Tab key, I just put these settings in my vimrc:

" let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" Then I use Ctrl-n to select completion and Tab to trigger snippet, it works well.


" I set ctrl-j to trigger snippet and tab to seletc completion,it works well
" Just change default key binding for ultisnips:
" let g:UltiSnipsExpandTrigger="<c-j>"
" It works well for me.

" from vim
" http://vim.wikia.com/wiki/Improve_completion_popup_menu
"does not work
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" this page : https://github.com/Valloric/YouCompleteMe/issues/420 also mentions
" this but <CR> mapping did not work for me.
"
" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/22253548#22253548

" let g:UltiSnipsExpandTrigger='<f10>'
" let g:UltiSnipsListSnippets='<c-f10>'
" let g:UltiSnipsJumpForwardTrigger='<f10>'
" let g:UltiSnipsJumpBackwardTrigger='<s-f10>'


" next try
" g:UltiSnipsJumpForwardTrigger          <c-j>
" g:UltiSnipsJumpBackwardTrigger         <c-k>

" from this
" https://github.com/Valloric/YouCompleteMe/issues/420
"
" let g:ulti_expand_or_jump_res = 0
" function ExpandSnippetOrCarriageReturn()
"     let snippet = UltiSnips#ExpandSnippetOrJump()
"     if g:ulti_expand_or_jump_res > 0
"         return snippet
"     else
"         return "\<CR>"
"     endif
" endfunction
"inoremap <expr> <CR> pumvisible() ? "\<C-R>\=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"
" inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>\<C-R>=EndwiseDiscretionary()\<CR>"

" http://chauncey.io/ultisnips-youcompleteme-now-if-i-can-just-get-you-two-to-cooperate/
" If selecting from YouCompleteMe, a space is typed and I’m on to my next word.
" If selecting an UltiSnips snippet, I use ⇥ to expand the snippet.



"YCM error about file
"solutuon: disable it
"to disable semantic completion for C++.
" g:ycm_filetype_specific_completion_to_disable = {
"   \ 'cpp': 1,
"   \ 'c': 1
"   \ }


" OR
" https://jonasdevlieghere.com/a-better-youcompleteme-config/
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  

" OR
" https://github.com/JDevlieghere/dotfiles/blob/master/.vim/.ycm_extra_conf.py
"
" OR
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" ycm detects c files as c++. fix that with vim info
let g:ycm_extra_conf_vim_data   = ['&filetype']


" open all clang syntex check location lost
"let g:ycm_always_populate_location_list = 1

" location list plugin
let g:lt_location_list_toggle_map = '<leader>g'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Here's how you can set the height (in number of lines) of the spawned window:
let g:lt_height = 10

" fix it by YCM
" https://gergap.wordpress.com/2015/08/11/ycm-fixit-feature/
map <F9> :YcmCompleter FixIt<CR>
nnoremap <F8> :YcmForceCompileAndDiagnostics<CR>:doautocmd FileType<CR>
" let g:ycm_filetype_blacklist={}
" worked as it has markdown in it
"
" if exists('g:ycm_filetype_blacklist')
"     let g:ycm_filetype_blacklist.markdown = 0
" endif

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}


" this also points to above
" http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/

" hitting tab inside a snippet will go to next tabstop, instead of completing the YCM suggestion. I had to add 
" let g:UltiSnipsJumpForwardTrigger = "<Right>"
" let g:UltiSnipsJumpBackwardTrigger = "<Left>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



" I found that it would sometimes eat my <CR>s when I wasn't expecting. I fixed this by adding let g:SuperTabCrMapping = 0. This disables supertab trying to cancel completion when pressing enter (which I don't think is necessary anyway with the way that YCM is designed).


"example:
   " g:UltiSnipsExpandTrigger               <tab>
   " g:UltiSnipsListSnippets                <c-tab>
   " g:UltiSnipsJumpForwardTrigger          <c-j>
   " g:UltiSnipsJumpBackwardTrigger         <c-k>

" UltiSnips will only map the jump triggers while a snippet
" is active to interfere as little as possible with other mappings.


" The default value for g:UltiSnipsJumpBackwardTrigger interferes with the
" built-in complete function: |i_CTRL-X_CTRL-K|. A workaround is to add the
" following to your vimrc file or switching to a plugin like Supertab or
" YouCompleteMe. >
"    inoremap <c-x><c-k> <c-x><c-k>``
"
"
"
"
"
"
"
"
"
"
"
"
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|\.dat$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

" " Enable these extensions. Cycle through them with ctrl-f and ctrl-b when the
" " CtrlP window is open.
" let g:ctrlp_extensions = ['tag', 'buffertag']

" " I like it better when the filename is used for the search. Toggle this with
" " <c-d>
" let g:ctrlp_by_filename = 1
" " Map the buffer switcher.
" map <leader>b :CtrlPBuffer<cr>
" " Map the recent files.
" map <leader>r :CtrlPMRUFiles<cr>
" " Map find-tag-in-buffer.
" map <leader>t :CtrlPBufTag<cr>
" " Map find-tag-in-all-buffers.
" map <leader>ta :CtrlPBufTagAll<cr>

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" http://ellengummesson.com/blog/2015/08/01/dropping-ctrlp-and-other-vim-plugins/


" Ack config
"
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack


