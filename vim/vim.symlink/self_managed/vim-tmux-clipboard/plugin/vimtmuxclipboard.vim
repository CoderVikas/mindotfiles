if exists("g:vim_tmux_clipboard_loaded")
  finish
endif
let g:vim_tmux_clipboard_loaded= 1

if !exists("g:vim_tmux_clipboard_temp_disable")
  let g:vim_tmux_clipboard_temp_disable = 0
endif

function! s:TmuxBufferName()
	let l:list = systemlist('tmux list-buffers -F"#{buffer_name}"')
	if len(l:list)==0
		return ""
	else
		return l:list[0]
	endif
endfunction

function! s:TmuxBuffer()
	return system('tmux show-buffer')
endfunction

function! s:VimTmuxToggle()
	if g:vim_tmux_clipboard_temp_disable == 1
		let g:vim_tmux_clipboard_temp_disable = 0
	else
		let g:vim_tmux_clipboard_temp_disable = 1
	endif
endfunction

function! vimtmuxclipboard#TmuxBufferIntoVim(timer)
	let @" = s:TmuxBuffer()
endfunction


function! s:Enable()

	if $TMUX=='' 
		" not in tmux session
		return
	endif

	let s:lastbname=""

	" if support TextYankPost
	if exists('##TextYankPost')==1
		" @"
		augroup vimtmuxclipboard
			autocmd!
			autocmd FocusLost * let s:lastbname=s:TmuxBufferName()
			autocmd	FocusGained   * if s:lastbname!=s:TmuxBufferName() | let @" = s:TmuxBuffer() | endif
			autocmd TextYankPost * silent! call system('tmux loadb -',join(v:event["regcontents"],"\n"))
		augroup END
		let @" = s:TmuxBuffer()
	else
		" vim doesn't support TextYankPost event
		" This is a workaround for vim
		augroup vimtmuxclipboard
			autocmd!
			autocmd FocusLost     *  if g:vim_tmux_clipboard_temp_disable != 1 | silent! call system('tmux loadb -',@") | endif
			autocmd	FocusGained   *  if g:vim_tmux_clipboard_temp_disable != 1 | let tempTimer = timer_start(50, 'vimtmuxclipboard#TmuxBufferIntoVim') | endif
		augroup END
		let @" = s:TmuxBuffer()
	endif

endfunction

command! VimTmuxToggle call s:VimTmuxToggle()

call s:Enable()

	" " workaround for this bug
	" if shellescape("\n")=="'\\\n'"
	" 	let l:s=substitute(l:s,'\\\n',"\n","g")
	" 	let g:tmp_s=substitute(l:s,'\\\n',"\n","g")
	" 	");
	" 	let g:tmp_cmd='tmux set-buffer ' . l:s
	" endif
	" silent! call system('tmux loadb -',l:s)

