syntax match cppNamespace /\w\+\ze::/
syntax match cppClassName /\(class\|struct\)\s\+\zs\w\+/
syntax match cppFuncName /\w\+\ze\s*(/
hi link cppClassName Structure
hi link cppFuncName  Function
