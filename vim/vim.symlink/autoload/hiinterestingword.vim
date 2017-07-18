" Highlight Word
"
" This will create a match for the word under the cursor, which will highlight all
" uses of the word in the file. If the match already exists, then the match is deleted,
" allowing the highlight to be toggled.

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

let s:base_mid = 68750

function! hiinterestingword#ClearInterestingWords()
    silent! call matchdelete(s:base_mid + 1)
    silent! call matchdelete(s:base_mid + 2)
    silent! call matchdelete(s:base_mid + 3)
    silent! call matchdelete(s:base_mid + 4)
    silent! call matchdelete(s:base_mid + 5)
    silent! call matchdelete(s:base_mid + 6)
endfunction
function! hiinterestingword#HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = s:base_mid + a:n

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    try
        call matchadd("InterestingWord" . a:n, pat, 1, mid)
    catch
        silent! call matchdelete(mid)
    endtry

    " Move back to our original location.
    normal! `z
endfunction
