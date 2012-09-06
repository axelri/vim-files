" My Vimrc file
" Maintainer: Axel Riese                                                       

" GUI Settings {

    if has("gui_running")
        colors zenburn
        set lines=48
        if has('mac') || has('macunix')
            set guifont=Inconsolata-dz:h13
        endif
        set columns=79

        set guioptions-=T  "remove toolbar
        set guioptions-=R  "remove right-hand scroll bar
        set guioptions-=r  "remove right-hand scroll bar
        set guioptions-=L  "remove left-hand scroll bar
        set guioptions-=l  "remove left-hand scroll bar
        set guioptions-=B
        set guioptions-=b
    endif
" }

" General {

    " Use Vim settings, rather than Vi settings
    set nocompatible

    "Use LaTeX syntax When editing a .text-file 
    let g:tex_flavor='latex'

    " Use Python 3 interface in command prompt
    let g:ConqueTerm_PyVersion=3

    " Switch to working directory of the current file
    set autochdir

    " Enable python compiler when opening .py-files
    autocmd BufNewFile,Bufread *.py compiler python

    " Automatically detect file and options
    filetype plugin on

    " Automatically indent the file
    filetype indent on

    " Enable syntax highlighting.
    syntax on

    " Automatically indent when adding a curly bracket, etc.
    set smartindent
    set autoindent

    " Tabs should be converted to a group of 4 spaces.
    " This is the official Python convention
    set shiftwidth=4
    set tabstop=4
    set expandtab
    set smarttab

    " Minimal number of screen lines to keep above and below the cursor.
    " I.e. always keep cursor in the middle when possible.
    set scrolloff=999

    " Use UTF-8.
    set encoding=utf-8

    " Automatically open, but do not go to (if there are errors) the quickfix /
    " location list window, or close it when is has become empty.
    "
    " Note: Must allow nesting of autocmds to enable any customizations for 
    " quickfix buffers.
    " Note: Normally, :cwindow jumps to the quickfix window if the command 
    " opens it (but not if it's already open). 
    " However, as part of the autocmd, this doesn't seem to happen.
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow

    " Limit line to 79 characters
    set fo=tcq

    " Yank from the cursor to the end of the line, to be consistent with
    " C and D commands.
    nnoremap Y y$

    " Map Q to q to avoid ex mode by mistake
    nnoremap Q q

    " Press ht (dvorak homerow) instead of ESC
    imap ht <Esc> 

    " Easier navigation in dvorak
    nmap t l
    vmap t l

    " Treat long lines as break lines (useful when moving around in them)
    map j gj
    map k gk

    " CRTL + N removes highlightning of searched text
    nmap <silent> <C-N> :noh<CR>

    " CRTL + S enables spellchecking (Swedish)
    map <silent> <C-S> :setlocal spell! spelllang=sv<CR>

    " CRTL + L enables spellchecking (English)
    map <silent> <C-L> :setlocal spell! spelllang=en<CR>

    " Shortcuts for moving between tabs
    noremap <C-Tab> gt
    noremap <S-C-Tab> gT

    " Space to toggle folding
    noremap <space> za

    " Enable easier navigation in help-mode
    nmap <buffer> <CR> <C-]>
    nmap <buffer> <BS> <C-T>

    " Folding based on indent
    set foldmethod=indent

    " Set all folds to be open when opening a file
    set foldlevelstart=999
" }

" Apperance {

    " Status line
    set laststatus=2
    set statusline=
    set statusline+=%-3.3n\                      " buffer number
    set statusline+=%f\                          " filename
    set statusline+=%h%m%r%w                     " status flags
    set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
    set statusline+=%=                           " right align remainder
    set statusline+=0x%-8B                       " character value
    set statusline+=%-14(%l,%c%V%)               " line, character
    set statusline+=%<%P                         " file position

    " Show line number, cursor position.
    set ruler

    " Display incomplete commands.
    set showcmd

    " Search as you type.
    set incsearch

    " Highlight search results
    set hlsearch

    " Ignore case when searching.
    set ignorecase

    " Show editing mode
    set showmode

    " Error bells are displayed visually.
    set visualbell

    " Turn off blinking cursor in normal mode
    set gcr=n:blinkon0
" }

" Plugin options { 

    " Taglist settings {
        " Map open Taglist to F8
        map <silent> <F8> :TlistToggle<CR>

        " Taglist options
        let Tlist_Show_One_File=1
        let Tlist_GainFocus_On_ToggleOpen=1
        let Tlist_Exit_OnlyWindow=1
        let Tlist_Enable_Fold_Column=0
        let Tlist_Show_Menu=1
    " }
    
    " NERDTree settings {
        " Map toggle NERDTree to F7, goto current file
        map <silent> <F7> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }
" }

" Custom functions {

    " Enable easier insert completion
    function! CleverTabPrev()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
            return "\<Tab>"
        else
            set noignorecase
	        return "\<C-P>"
	    endif
	    endfunction
    
    " Returns tab character (for Makefile-editing)
    function! CleverTabNext()
        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
            return "\t"
        else
            set noignorecase
	        return "\<C-N>"
	    endif
	    endfunction
        
    inoremap <Tab> <C-R>=CleverTabPrev()<CR>
    inoremap <S-Tab> <C-R>=CleverTabNext()<CR>

    " Ugly way to reset the ignorecase after CleverTab
    inoremap <silent> <ESC> <ESC>:set ignorecase<CR>
" }


" Filetype Settings {

    " C settings {
        " No textwidth
        au BufNewFile,Bufread *.c set textwidth=0
        au BufNewFile,Bufread *.h set textwidth=0
    " }
    " HTML settings {
        " No textwidth
        " Smaller tabs
        au BufNewFile,Bufread *.html set textwidth=0
        au BufNewFile,Bufread *.html set columns=89
        au BufNewFile,Bufread *.html set shiftwidth=2
        au BufNewFile,Bufread *.html set tabstop=2
" }
