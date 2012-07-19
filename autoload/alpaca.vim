" 最大maxのランダムな整数を返す
function! alpaca#rand(max)
  if !has('reltime')
    " Same value.
    return 0
  endif

  let time = reltime()[1]
  return (time < 0 ? -time : time)% (a:max + 1)
endfunction

" alpacaを表示する
function! alpaca#show_alpaca(number)
  silent! execute has_key(a:options, 'open') ? a:options.open : g:ref_open
  enew

  let animation = [
    \[
        \[
        \ "  A\\_A\\",
        \ "(=' .' ) ~w",
        \ "(,(\")(\")",
        \],
    \],
  \]
  let number = (a:number != '') ? a:number : len(animation)
  let anim = get(animation, number, animation[alpaca#rand(len(animation) - 1)])
  let &cmdheight = len(anim[0])

  for frame in anim
    echo repeat("\n", &cmdheight-2)
    redraw
    echon join(frame, "\n")
    sleep 300m
  endfor
  redraw

endfunction

