setlocal nospell
setlocal nolist
setlocal linebreak
setlocal spelllang=en_gb
setlocal colorcolumn=120
setlocal textwidth=120
setlocal wrapmargin=120


" Highlight words to avoid in tech writing
" http://css-tricks.com/words-avoid-educational-writing/
" https://github.com/pengwynn/dotfiles
highlight TechWordsToAvoid ctermbg=red ctermfg=white
function! MatchTechWordsToAvoid()
  match TechWordsToAvoid /\c\(obviously\|basically\|simply\|of\scourse\|clearly\|just\|everyone\sknows\|however\|so,\|easy\)/
endfunction
call MatchTechWordsToAvoid()
autocmd BufWinEnter *.md call MatchTechWordsToAvoid()
autocmd InsertEnter *.md call MatchTechWordsToAvoid()
autocmd InsertLeave *.md call MatchTechWordsToAvoid()
autocmd BufWinLeave *.md call clearmatches()

let b:undo_ftplugin = 'setl nospell< nolist< linebreak< colorcolumn< textwidth< wrapmargin<'
