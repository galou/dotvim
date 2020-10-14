" FSHeaderAbove is defined in fswitch.vim.
command! A FSHeaderAbove

function! s:delete_trailing_whitespace()
    " TODO: do not modify the '/' register.
    " TODO: do not jump.
    if exists("g:remove_whitespace") && g:remove_whitespace == 1
        keepjumps %s/\s\+$//e
    endif
endfunction

command! RemoveTrailingWhitespace call s:delete_trailing_whitespace()

augroup mine
    " Remove all mine autocommands
    autocmd!
    autocmd BufWritePre *.c RemoveTrailingWhitespace
    autocmd BufWritePre *.cpp RemoveTrailingWhitespace
    autocmd BufWritePre *.h RemoveTrailingWhitespace
    autocmd BufWritePre *.hpp RemoveTrailingWhitespace
    autocmd BufWritePre *.py RemoveTrailingWhitespace
augroup END
