let s:V = vital#of('vital')
let s:C = s:V.import('System.Cache.Simple')

let s:factorial_cache = s:C.new()
function! s:factorial_cache.cache_key(n)
  " Convert n (int) into cache_key (str)
  return "" . a:n
endfunction

function! s:factorial(n)
  if a:n == 0
    return 1
  elseif s:factorial_cache.has(a:n)
    return s:factorial_cache.get(a:n)
  else
    let x = s:factorial(a:n - 1) * a:n
    call s:factorial_cache.set(a:n, x)
    return x
  endif
endfunction

echo s:factorial(10)
