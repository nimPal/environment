syn keyword ctype UINT8 UINT16 UINT32 UINT64 INT8 INT16 INT32 INT64 Boolean CONST
syn keyword ctype Uint8 Uint16 Uint32 Uint64
syn keyword ctype Int8 Int16 Int32 Int64
syn keyword ctype VOID STATIC
syn keyword ctype tstatic
syn keyword ctype uint96_t uint128_t uint160_t uint192_t
syn keyword ctype int96_t int128_t int160_t int192_t

hi Comment   ctermfg=240
hi PreCondit ctermfg=207

highlight hi_function ctermfg=75
highlight hi_struct ctermfg=40
highlight hi_enum ctermfg=40
highlight hi_MACRO ctermfg=182
highlight hi_struct_fields ctermfg=45

syn match match_struct "\(struct[ ]\+\)\@<=\w\+[ \*]\@="
syn match match_enum "\<\w\+_t\>\|\<\w\+Enum\>"
syn match match_MACRO "\(#.*\)\@<!\<[A-Z_][A-Z0-9_]*\>"
syn match match_function "\(#define.*\)\@<!\w\+[ ]*(\@="
syn match match_struct_fields "\(->\)\@<=\w\+\|\(\.\)\@<=\w\+"

hi def link match_function hi_function
hi def link match_struct hi_struct
hi def link match_enum hi_enum
hi def link match_MACRO hi_MACRO
hi def link match_struct_fields hi_struct_fields


" This function customises what is displayed on the folded line:
set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)
    let linecount = v:foldend + 1 - v:foldstart
    let plural = ""
    if linecount != 1
        let plural = "s"
    endif
    let foldtext = printf(" +%s %d line%s: %s", v:folddashes, linecount, plural, line)
    return foldtext
endfunction
" This is the line that works the magic
set foldmarker=#if,#endif
set foldmethod=marker
