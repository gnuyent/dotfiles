let g:currentmode={
    \ 'n'      : 'Normal',
    \ 'no'     : 'Normal·Operator Pending',
    \ 'v'      : 'Visual',
    \ 'V'      : 'V·Line',
    \ "\<C-V>" : 'V·Block',
    \ 's'      : 'Select',
    \ 'S'      : 'S·Line',
    \ '^S'     : 'S·Block',
    \ 'i'      : 'Insert',
    \ 'R'      : 'Replace',
    \ 'Rv'     : 'V·Replace',
    \ 'c'      : 'Command',
    \ 'cv'     : 'Vim Ex',
    \ 'ce'     : 'Ex',
    \ 'r'      : 'Prompt',
    \ 'rm'     : 'More',
    \ 'r?'     : 'Confirm',
    \ '!'      : 'Shell',
    \ 't'      : 'Terminal'
    \}

" Determine if paste mode
function! PasteForStatusline()
    let paste_status = &paste
    if paste_status == 1
        return "PASTE "
    else
        return ""
    endif
endfunction

" Set overall colors
hi User1 guibg=#343D46 guifg=#D8DEE9                     " Gray background, white text

set laststatus=2
set noshowmode
set statusline=
set statusline+=%1*\ %n\                                 " Buffer number
set statusline+=%1*│                                     " Separator
set statusline+=%1*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%1{toupper(PasteForStatusline())}        " Paste Mode
set statusline+=%1*│                                     " Separator
set statusline+=%1*\ %<%t%m%r%h%w\                       " File name, modified, readonly, helpfile, preview
set statusline+=%=                                       " Right Side
set statusline+=%1*\ %Y\                                 " File Type
set statusline+=%1*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})\                              " FileFormat (dos/unix..)
set statusline+=\%{coc#status()}%{get(b:,'coc_current_function','')}\     " coc.nvim statusline
set statusline+=%1*│                                     " Separator
set statusline+=%1*\ %l/%L\:%v                           " Line number / total lines / columns
