highlight hi_coverged ctermfg=green
highlight hi_not_coverged ctermfg=red
highlight hi_dont_care ctermfg=gray

syn match match_covered "^\s*[0-9].*"
syn match match_not_covered "^\s*#.*"
syn match match_dont_care "^\s*-.*"

hi def link match_covered hi_coverged
hi def link match_not_covered hi_not_coverged
hi def link match_dont_care hi_dont_care
