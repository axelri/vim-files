" My Vimrc file
" Maintainer: Axel Riese                                                       

" Bundle setup {
    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    " github repos
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'davidhalter/jedi-vim'
    Bundle 'ervandew/supertab'
    Bundle 'jiangmiao/auto-pairs'
    Bundle 'jnwhiteh/vim-golang'
    Bundle 'kien/ctrlp.vim'
    Bundle 'michaeljsmith/vim-indent-object'
    Bundle 'msanders/snipmate.vim'
    Bundle 'nvie/vim-flake8'
    Bundle 'olethanh/Vim-nosecompiler'
    Bundle 'reinh/vim-makegreen'
    Bundle 'scrooloose/nerdtree'
    Bundle 'sickill/vim-pasta'
    Bundle 'tomtom/tcomment_vim'
    Bundle 'tpope/vim-endwise'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-markdown'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-surround'
    Bundle 'tsaleh/vim-matchit'
    Bundle 'skwp/greplace.vim'
    Bundle 'vim-scripts/mru.vim'
    Bundle 'vim-scripts/taglist.vim'
    Bundle 'xuhdev/SingleCompile'
    
    filetype plugin indent on     " required!

    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
    " Make sure to install vundle first, just paste in a term:
    " git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" }

" General {
    let mapleader = ","
    set mouse=a
    set backspace=indent,eol,start
    set wildmenu
    set wildignore+=*.o,*.obj,*.git,*.class,*.rbc,.svn,vendor/gems/*

    set smartindent
    set autoindent
    set shiftwidth=4
    set tabstop=4
    set expandtab
    set smarttab

    set scrolloff=999
    " set report=0
    set encoding=utf-8
    set autochdir "dir of current file
    set gdefault "search/replace globally

    " Use english as the main language
    if has('mac') || has('macunix')
        language en_US
    endif
" }

" Keymappings {
    " Yank from the cursor to the end of the line, to be consistent with
    " C and D commands.
    nnoremap Y y$

    " Map Q to q to avoid ex mode by mistake
    nnoremap Q q

    " Easier navigation in dvorak
    nmap t l
    vmap t l

    " Treat long lines as break lines (useful when moving around in them)
    map j gj
    map k gk

    " CRTL + N removes highlighting of searched text
    nmap <silent> <C-N> :noh<CR>

    map <silent> <C-S> :setlocal spell! spelllang=sv<CR>
    map <silent> <C-L> :setlocal spell! spelllang=en<CR>

    " CTRL + J splits the line at the cursor
    nnoremap <NL> i<CR><ESC>

    " Shortcuts for moving between tabs
    noremap <C-Tab> gt
    noremap <S-C-Tab> gT

    " Space to toggle folding
    noremap <space> za

    " Enable easier navigation in help-mode
    " TODO For some reason doesn't work
    " has to be in ftplugin/help.vim
    " nnoremap <buffer> <CR> <C-]>
    " nnoremap <buffer> <BS> <C-T>

    map <F10> :cprevious<Return>
    map <F11> :cnext<Return>

    " Terminal mappings - uses command in GUI instead
    map <C-b> :SCCompile<Return>
    map <C-S-b> :SCCompileRun<Return>
" }

" Apperance {
    if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
        syntax on
    endif

    if has('mac') || has('macunix')
        set bg=dark
        colorscheme solarized
    endif

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

    set ruler
    set showcmd
    set incsearch
    set hlsearch
    " set ignorecase
    set showmode
    set visualbell
    set gcr=n:blinkon0

    set fo=tcq
    set textwidth=0
    set nowrap

    set foldmethod=indent
    " Set all folds to be open when opening a file
    set foldlevelstart=999

" }

" Plugins { 
    " auto-pairs
        " doesn't get along with some unicode chars
        let g:AutoPairsShortcuts = ""
        let g:AutoPairsShortcutFastWrap = ""
        let g:AutoPairsShortcutJump = ""

    " easymotion
        let g:EasyMotion_leader_key = '<Leader>'
    
    " Taglist
        map <silent> <F10> :TlistToggle<CR>

        let Tlist_Show_One_File=1
        let Tlist_GainFocus_On_ToggleOpen=1
        let Tlist_Exit_OnlyWindow=1
        let Tlist_Enable_Fold_Column=0
        let Tlist_Show_Menu=1

    " MakeGreen
        map <C-t> :MakeGreen<CR>
    
    " NERDTree 
        map <silent> <F11> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1

    " Jedi 
        " let g:jedi#popup_on_dot = 0

    " Supertab settings 
        " Enable simultaneous use with snipMate
        let g:SuperTabDefaultCompletionType = "context"
        set completeopt=menuone,longest,preview

    " todo thingie
    " from https://coderwall.com/p/prfnnw
        command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

    " SingleCompile commands
        command Make SCCompile
        command Run SCCompileRun
        command Log SCViewResult
        let g:SingleCompile_showquickfixiferror = 1

" }

" Filetype Settings {
    "Use LaTeX syntax When editing a .text-file 
    let g:tex_flavor='latex'

    " TODO: This should really be tidied up
    " HTML 
        au BufNewFile,Bufread *.html set columns=89
        au BufNewFile,Bufread *.html set shiftwidth=2
        au BufNewFile,Bufread *.html set tabstop=2

    " Go
        "Automatically reformat using gofmt when saving go buffers
        autocmd FileType go autocmd BufWritePre <buffer> Fmt
        au BufNewFile,Bufread *.go set shiftwidth=4
        au BufNewFile,Bufread *.go set tabstop=4
        au BufNewFile,Bufread *.go set noexpandtab

    " Java 
        autocmd Filetype java set makeprg=javac\ %
        set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

    " Ruby 
        au BufRead,BufNewFile {Gemfile,Rakefile} set ft=ruby
        au BufNewFile,Bufread *.rb set shiftwidth=2
        au BufNewFile,Bufread *.rb set tabstop=2

    " Python 
        " supertab doesn't work...
        inoremap <C-space> <C-x><C-o>
        autocmd BufNewFile,BufRead *.py compiler nose

    " TeX 
        au BufNewFile,Bufread *.tex set shiftwidth=2
        au BufNewFile,Bufread *.tex set tabstop=2
        au BufNewFile,Bufread *.tex set wrap
        au BufNewFile,Bufread *.tex set linebreak
        " Nice light theme for editing lots of text
        if has("gui_running")
            au BufNewFile,Bufread *.tex set bg=light
        endif

    " .ini
        au BufNewFile,Bufread *.ini set shiftwidth=2
        au BufNewFile,Bufread *.ini set tabstop=2

    " C 
        if has('mac') || has('macunix')
            au BufNewFile,Bufread *.c compiler clang
            au BufNewFile,Bufread *.c set makeprg=clang
            au BufNewFile,Bufread *.h compiler clang
            au BufNewFile,Bufread *.h set makeprg=clang
        endif
" }

" Other autocmds {
    " ruthlessly stolen from 
    " https://github.com/thoughtbot/dotfiles/blob/master/vimrc
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 79 characters.
        autocmd FileType text setlocal textwidth=79

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
    augroup END

    " Note: Maybe this causes conflict with SingleCompile,
    " empty quickfix window remains open
    " Automatically open, but do not go to (if there are errors) the quickfix /
    " location list window, or close it when is has become empty.
    " Note: Must allow nesting of autocmds to enable any customizations for 
    " quickfix buffers.
    " Note: Normally, :cwindow jumps to the quickfix window if the command 
    " opens it (but not if it's already open). 
    " However, as part of the autocmd, this doesn't seem to happen.
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
" }
