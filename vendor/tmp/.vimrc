set number
set laststatus=2
set list
set expandtab
"tabスペース4つ分
set tabstop=4
set listchars=trail:_,extends:>,precedes:<,nbsp:%
set history=50
set backspace=indent,start,eol
set columns=172
set lines=47
syntax on

"スペースハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Yellow
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
