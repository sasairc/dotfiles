set statusline=%t\ %m%r%h%w[%Y][%{&fenc}][%{&ff}]%=\%{g:Date()}C:%04c,L:%04l/%04L%4p%%

" 背景色をそのまま適用
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

" お好きなカラースキーム
colorscheme desert
set background=dark

" インサートモード時の色変更
let g:hi_insert = 'highlight StatusLine gui=none ctermfg=yellow ctermbg=black'

if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END\%{g:Date()}
endif
 
let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction
 
function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction

if has('unix') && !has('gui_running')
    inoremap <silent> <ESC> <ESC>
    inoremap <silent> <C-c> <ESC>
endif
 
" ステータスラインに日時を表示する
function! g:Date()
    return strftime("%x %H:%M ")
endfunction
