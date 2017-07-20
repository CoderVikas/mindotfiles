" vim: foldmethod=marker foldlevel=1 foldclose=all textwidth=80 ts=2:

" http://stackoverflow.com/questions/14353307/is-there-a-maxlength-on-vims-runtimepath-if-so-how-can-i-raise-it
"


" Section Bootstrap {{{
    " Install vim-plug if missing
    if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd VimEnter * PlugInstall
    endif
" }}}
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
source ~/.vim/custom/vim-plugins-colors.vim
" Applications Plugins {{{
  " Note Taking Applications {{{
    "^Plug 'junegunn/vim-journal'
    "^Plug 'xolox/vim-misc' "needed for notes
    "^Plug 'xolox/vim-notes'
    "g Plug 'MattesGroeger/vim-bookmarks'
  " }}}
  " Misc Applications {{{
    " 800
    "Plug 'itchyny/calendar.vim'
    "Plug 'mhinz/vim-startify'         " frequent files at start
    "Plug 'vim-scripts/mru.vim'
  " }}}
  " Unicode Plugins {{{
    " Plug 'tpope/vim-characterize'
  " }}}
  " Highlight Plugins {{{
    " Plug 'pgdouyon/vim-evanesco'                  " vim search highlighting
  " }}}
" }}}
" Section Sensible Plugins {{{
  Plug 'tpope/vim-sensible'         " setting everyone can agree on
  Plug 'tpope/vim-unimpaired'       " short normal mode aliases for common ex commands
  Plug 'tpope/vim-repeat'           " . to repeat last plugin edit as single motion
  Plug 'tpope/vim-commentary'       " Comment stuff out
  Plug 'tpope/vim-surround'         " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
  Plug 'ConradIrwin/vim-bracketed-paste' " No explicit paste is needed
  Plug 'sickill/vim-pasta'          " adjust indent to dest context
  Plug 'tpope/vim-sleuth'           " detect indent style (tabs vs. spaces)
  Plug 'christoomey/vim-system-copy' "cp and cP for copy-motion and copy-line to clipboard
  Plug 'christoomey/vim-titlecase'  " gt and gT for title case command/operator.
  Plug 'christoomey/vim-sort-motion' " gs sort command
  "g Plug 'mattn/webapi-vim'            " needed for quicklink
  "g Plug 'christoomey/vim-quicklink'   " gx gl open link in browser
  Plug 'vim-scripts/ReplaceWithRegister' " gr replace command
  Plug 'jiangmiao/auto-pairs'       " automatic closing of quotes, parenthesis, brackets, etc.
  Plug 'bkad/camelcasemotion'     " motion to select a substring in camelcase.
  Plug 'tpope/vim-abolish'          " abbrevations and crc motion for camelcase
" }}}
" TextObjects and Motions {{{
  "^Plug 'justinmk/vim-sneak'       " Extend f, t with sneak
  Plug 'easymotion/vim-easymotion'  " Easymotion for lines and pharses
  "Plug 'haya14busa/vim-easyoperator-line'
  "Plug 'haya14busa/vim-easyoperator-phrase'
  " Section TextObjects {{{
    " Plug 'wellle/targets.vim'
    " Plug 'kana/vim-textobj-user'
    " Plug 'kana/vim-niceblock'
    " Plug 'kana/vim-textobj-indent'
    " Plug 'michaeljsmith/vim-indent-object'
    " Plug 'kana/vim-textobj-function'
    " Plug 'thinca/vim-textobj-function-javascript'
    " Plug 'kana/vim-textobj-line'
    " Plug 'kana/vim-textobj-fold'
    " Plug 'kana/vim-textobj-datetime'
    " Plug 'kana/vim-textobj-entire'
  " }}}
" }}}
" Search and AutoComplete Plugins {{{
  " Active Plugins {{{
    Plug 'haya14busa/incsearch.vim' " incremental improved search
    "g Plug 'ctrlpvim/ctrlp.vim'
    "newMac Plug 'tacahiroy/ctrlp-funky'  " search for functions
    "newMac Plug 'mhinz/vim-grepper'
  " }}}
  " InActive Plugins {{{
    " fuzzy searcher: fzf or controlspace or controlp
    " controlp is highly rated. so is fzf+ag combination.
    " install for shell and vim together 
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
    " Plug 'junegunn/fzf.vim'                       " vim client
    
    
    " ctrlspace has some issues - when the window is opening - the focus lost
    " and focus gain messes up with it. I did not try this much. Will now try
    " ctrlp.
    
    " this can name tabs and tied down buffer list to tabs.
    " list all tabs.
    " search through open buffers and switch to specific tabs.
    " mostly about tab management. ctrlspace is starting point.
    " this can exist with ctrlp-
    "newMac Plug 'vim-ctrlspace/vim-ctrlspace'         "another fuzzy searcher
    "newMac Plug 'mileszs/ack.vim'
    " silver-searcher and ack ?
    "newMac Plug 'ervandew/supertab'       " tab in insert mode for completion.
    "newMac Plug 'Valloric/ListToggle'
    "newMac Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    " make sure above two are in this order.
    " also put ultisnips later.
    " make YCM compatible with UltiSnips (using supertab)
    "let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    "let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    "let g:SuperTabDefaultCompletionType = '<C-n>'
    " better key bindings for UltiSnipsExpandTrigger
    " let g:UltiSnipsExpandTrigger = "<tab>"
    " let g:UltiSnipsJumpForwardTrigger = "<tab>"
    " let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    "^^Plug 'wincent/command-t'     " command-T : pending test
    " command-t needs system ruby build step and it is hard to 
    " setup. it is very close to ctrlp. skill testing
    " it for now
  " }}}
" }}}
" Terminals, CopyPaste, AutoSave Plugins {{{
  " HyperTerm & iTerm2 Plugins {{{
    Plug 'sjl/vitality.vim'  " FocusGain and FocusLost
    " Vitality above work saem as below vim plugin.
    "Plug 'tmux-plugins/vim-tmux-focus-events' " FocusGain and FocusLost tmux-vim clips
  " }}}
  " Tmux and AutoComplete {{{
    " this works - not clear how will it work with YCM or omni stuff
    "newMac Plug 'wellle/tmux-complete.vim'
  " }}}
  " Tmux and Copy/Paste {{{
    "newMac Plug 'tpope/vim-obsession'      " save vim session
    Plug 'christoomey/vim-tmux-navigator' " require tmux-sensible & autoload.
    "Plug 'roxma/vim-tmux-clipboard' " main vim<->tmux clipping
		Plug '~/.vim/self_managed/vim-tmux-clipboard' 	" modified roxma/vim-tmux-clipboard
    " Tmux Inactive {{{
      "Plug 'benmills/vimux' " run tmux commands from vim - build usecase
      "Plug 'tpope/vim-tbone' " vim <-> tmux buffers
    " }}}
  " }}}
  " Registers Inactive {{{
    " '"' key and '@' key to open it up.
    " C-r in insert mode
    "newMac Plug 'junegunn/vim-peekaboo'
    "newMac Plug 'svermeulen/vim-easyclip' " working now
" }}}
"}}}
" Syntax And Build Plugins {{{
  " Active Syntax {{{
    "newMac Plug 'tmux-plugins/vim-tmux'        " .tmux.conf (K is useful)
    Plug 'kchmck/vim-coffee-script'     " a markdown dependency
    Plug 'tpope/vim-markdown'           " markdown codeblock support
    " option 1
    " Plug 'JamshedVesuna/vim-markdown-preview' " did not work as required rendering tools are missing
    " ugly formatting from using MarkDown.pl perl
    " try pandoc now - pandoc worked greate with changes to above and some css
    " added in above package. commit to this package.
    " even with http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
    " options new 2
    " Plug 'wikimatze/hammer.vim' " this is not a vim-plug package. install
    " manually. could not make it work. still not work after ruby jugglary.
    " options new 3
    " Plug 'greyblake/vim-preview'
    " this one open new tab for every save. not useful. required too much ruby
    " admin
    "
    " option 2 - this is a syntax file only
    "Plug 'godlygeek/tabular'
    "^Plug 'godlygeek/tabular'          " also for coding style formatting
    "Plug 'plasticboy/vim-markdown', { 'dir': '~/.vim/plugged/platicsboy-vim-markdown' } 
    " let see this
    " option 3
    " Plug 'suan/vim-instant-markdown' " very nicely worked. no theme though
    " open new 4
    " Plug 'MikeCoder/markdown-preview.vim'
    " python - based nothing major improvement here
    " Plug 'waylan/vim-markdown-extra-preview'
    " did not work
  " }}}
  " Inactive Syntax {{{
    "^^Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
    "^Plug 'sheerun/vim-polyglot'
    "^Plug 'tpope/vim-git'              " syntax
  " }}}
  " Active Java/Ruby/Go AutoComplete Syntax {{{
    Plug 'tpope/vim-endwise'              " automatically add end in ruby (others?)
  " }}}
  " Inactive Java/Ruby/Go AutoComplete Syntax {{{
    "^Plug 'tpope/vim-classpath' " Java
    " Plug '~/.vim/self_managed/eclim'                  " install http://eclim.org/install.html
    " eclim is disabled with two steps. let me see if I can add all of this
    " together. I added all of eclim under one directory above. tested and
    " working. Just comment above line to disable eclim.
    " http://eclim.org/install.html#installer
    " http://eclim.org/eclimd.html#eclimd-headless
    " Pathogen, etc.:
        "$ vim -u NONE -U NONE --cmd \
        "  "set nocp | sy on | filetype plugin indent on | set rtp+=$HOME/.vim/bundle/eclim | ru plugin/eclim.vim"
        "  what is .vim/bundle/eclim here 
        "  this is Dvim.files directory we gave during install
        "  Above plug uses eclim directory in .vim 
        "  http://stackoverflow.com/questions/23228989/ycm-does-not-work-with-eclim
    " http://eclim.org/vim/settings.html - various eclipse like eclim settings
    "
    "
    " https://github.com/ervandew/eclim/issues/324
    "  eclim disables all of syntastic filetype lint checks.
    "
    " http://eclim.org/vim/java/validate.html
    " disable eclim for now and we will come back to it.
    "
    "newMac Plug 'vim-syntastic/syntastic'       " syntastic conflicts with ecim - disable eclims
    " also syntastic is not needed anymore as YCM has all the features of
    " syntastic
    "
    " youcompleteme-why-did-ycm-stop-using-syntastic-for-diagnostics-display
    " http://stackoverflow.com/questions/24500281/youcompleteme-and-syntastic-compatibility
    
    " https://github.com/Valloric/YouCompleteMe
    " https://github.com/Valloric/YouCompleteMe/commit/b0c7c8e680f5a37d72987ccf1cb970d16b01b0a1
    " https://github.com/Valloric/YouCompleteMe/issues/359
    "
    " without eclim ycm does not do any check for java.
    " lets enable syntastics and see what happens.
    "
    " syntastic can't do omni completions
    " also syntastic check for package and dependencies is not there. eclim is
    " better for java
    "
    " syntastic support lots of other formats but eclim will mask out all of
    " them.
    "
    "
    " syntastic get disabled for various cases
    " https://github.com/vim-syntastic/syntastic/issues/1237
    "
    "newMac Plug 'myint/syntastic-extras'
    "newMac Plug 'artur-shaik/vim-javacomplete2' " Java completions
    "^^ Plug 'tpope/vim-projectionist' " Java project
    "^^Plug 'vim-ruby/vim-ruby'
    "^^Plug 'fatih/vim-go', { 'for': 'go' }
    "newMac Plug 'pangloss/vim-javascript'
  " }}}
  " Coding Style Format {{{
    "^^ Plug 'rhysd/vim-clang-format'
    " Plug 'rip-rip/clang_complete'  " ycm does this natively. not needed
    "Plug 'maksimr/vim-jsbeautify'      " C-f to format code to beautify
    "^Plug 'junegunn/vim-easy-align'
    Plug 'AndrewRadev/splitjoin.vim' " extend join to code blocks.
  " }}}
  " Indent and Whitespace {{{
    Plug 'Yggdroot/indentline'
    "^Plug 'nathanaelkane/vim-indent-guides'
    " useful but at odd with indentline
    " clear function uses m command not sure if 
    "  easyclip hiding that command interfere with this
    " Plug 'ntpeters/vim-better-whitespace'
  " }}}
  " Code Comment {{{
    "^Plug 'scrooloose/nerdcommenter'
    "^Plug 'tomtom/tComment_vim'        " Good comment
  " }}}
  " Tag Help {{{
    "^^ Plug 'taglist.vim'
    "^^ Plug 'xolox/vim-easytags'
  " }}}
  " Vim Shells {{{
    "newMac Plug 'sjl/clam.vim'
    "newMac Plug 'thinca/vim-quickrun'
    "Plug 'Shougo/vimproc.vim', { 'do': 'make' }    " command from vim
    "Plug 'Shougo/vimshell.vim'                     " shell in vim-buffer
    "Plug 'vim-scripts/Conque-Shell'
    "Plug 'vim-scripts/Conque-GDB'
  " }}}
  " Section Build and Command Plugins {{{
    "newMac Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
    "newMac Plug 'tpope/vim-eunuch' " unix commands
  " }}}
" }}}
" Section Git Plugins {{{
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'            " enhancement on top of fugitive
  "too much autocommands by gitgutter
  Plug 'airblade/vim-gitgutter'     " git diff in sign column
  "^Plug 'mhinz/vim-signify'        " similiar to above in sign column
  Plug 'airblade/vim-rooter'        " cd into project root
" }}}
  " Vim Scripts {{{
    "newMac Plug 'tpope/vim-scriptease'
  " }}}
  " File Browser Plugins {{{
    "Plug 'tpope/vim-vinegar'          "netrw and buffers and commands
    "^Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    "^Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    "^Plug 'ryanoasis/vim-devicons'     " get NERDFont Droid Sans Mono separately
    "^Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " }}}
" Edit, Comment and Alignments Plugins {{{
  Plug 'tpope/vim-capslock'     " software capslock
  "^Plug 'tpope/vim-speeddating' " date support
  "^Plug 'mattn/emmet-vim'      " abbrevations
  " MultiCursor Support {{{
    Plug 'terryma/vim-multiple-cursors' " high rating editing
  " }}}
  " Distraction Free {{{
    Plug 'junegunn/goyo.vim'        " distraction free
    "^Plug 'junegunn/limelight.vim'
  " }}}
  " AutoClosing {{{
    "^Plug 'Raimondi/delimitMate' " automatic closing quotes, parenthesis brackets, etc.
    "^Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
  " }}}
  " Undo Recording {{{
    Plug 'sjl/gundo.vim'
    "Plug 'hjdivad/vimlocalhistory'    " check for performance
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  " }}}
  " Snipmates {{{
    " all 4 of below for snipmate in order
    "^Plug 'MarcWeber/vim-addon-mw-utils'
    "^Plug 'tomtom/tlib_vim' "util functions
    "^Plug 'garbas/vim-snipmate'
    "^Plug 'honza/vim-snippets'
    "^Plug 'SirVer/ultisnips'
    "^Plug 'Shougo/neocomplete.vim'
    "^Plug 'Shougo/neosnippet'
    "^Plug 'Shougo/neosnippet-snippets'
    " best combo I THINK is following
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " with ycm:
    " https://github.com/Valloric/YouCompleteMe/issues/1833
    "

    "Plug 'davidhalter/jedi-vim'
    " hint:
    "let g:ycm_filetype_specific_completion_to_disable = { 'python': 1 }
    "let g:jedi#show_call_signatures_delay = 0?
    "from: https://github.com/Valloric/YouCompleteMe/issues/1890   
    "
    "
    " YCM can work with eclimd (java, python) or jedi
    " https://github.com/davidhalter/jedi-vim
    "
    "
    " todo: integrate utlisnips with YCM
    " }}}
" }}}
" Section Buffers and Tabs {{{
  "^Plug 'weynhamz/vim-plugin-minibufexpl' "mini buffer explorer
  "^Plug 'kien/tabman.vim'
  "^Plug 'jeetsukumaran/vim-buffergator'
  "newMac Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
" }}}
source ~/.vim/custom/vim-plugins-post-colors.vim
call plug#end()
