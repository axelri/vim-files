" GUI appearance
    set bg=dark
    let g:solarized_bold=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    colors solarized
    set lines=60
    set columns=80
    " double width for vimdiff
    if &diff
        set columns=180
        set number
    endif

    if has('mac') || has('macunix')
        set guifont=Inconsolata-dz:h12
    endif

    set guioptions+=a  "allow easier interapplication copy-paste
    set guioptions-=T  "remove toolbar
    set guioptions-=R  "remove right-hand scroll bar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=l  "remove left-hand scroll bar
    set guioptions-=B  "remove bottom horizontal scroll bar
    set guioptions-=b
" }

" GUI commands and keymaps
    command Scroll set guioptions+=Rr
    command Noscroll set guioptions-=Rr

    if has("gui_macvim")
        " remove MacVim make keymap"
        macmenu Tools.Make key=<nop>
        map <D-b> :SCCompile<Return>
        map <D-B> :SCCompileRun<Return>
        map <D-r> :MRU<Return>
        map <D-e> :cwindow<Return>
        map <D-E> :cclose<Return>

         " Command-P for the control-p plugin
        macmenu &File.Print key=<nop>
        map <D-p> :CtrlPMixed<cr>
        imap <D-p> <esc>:CtrlPMixed<cr>

    endif
" }
