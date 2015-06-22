" Tell (n)vim we're using chicken for scheme files
let b:is_chicken=1
" Add chicken keywords
setlocal lispwords+=let-values,condition-case,with-input-from-string
setlocal lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
setlocal lispwords+=call-with-output-file
