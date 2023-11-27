if exists("b:current_syntax")
  finish
endif

syn match csvField1 /[^;]*;\?/ display           nextgroup=csvField2
syn match csvField2 /[^;]*;\?/ display contained nextgroup=csvField3
syn match csvField3 /[^;]*;\?/ display contained nextgroup=csvField4
syn match csvField4 /[^;]*;\?/ display contained nextgroup=csvField5
syn match csvField5 /[^;]*;\?/ display contained nextgroup=csvField6
syn match csvField6 /[^;]*;\?/ display contained

hi def link csvField1 String
hi def link csvField2 Structure
hi def link csvField3 PreCondit
hi def link csvField4 Comment
hi def link csvField5 Keyword
hi def link csvField6 Float

let b:current_syntax = "csv"
