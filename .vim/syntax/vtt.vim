"let fe=expand("%:e")
"let ext=["srt", "SRT", "vtt", "VTT"]
"if (index(ext, fe) < 0)
"	return
"endif
setlocal filetype=srt
syn case ignore
syn match srtContent ".*"
syn match srtArrow "-->"
syn match srtComment "^#.*"
syn match srtError "\[br\]"
syn match srtError "{y:[bi][bi]}"
syn match srtError "{y:[bi]}"
syn match srtNumber "^[0-9]\+\s*$"
syn region transparent matchgroup=srtTime start='[0-9: ]\+[\., ][0-9 ]*' end='[0-9: ]\+[\., ][0-9 ]*' contains=srtArrow oneline

hi def link srtArrow      Type
hi def link srtComment    Comment
hi def link srtContent    Identifier
hi def link srtError      Error
hi def link srtNumber     Number
hi def link srtTime       Statement
