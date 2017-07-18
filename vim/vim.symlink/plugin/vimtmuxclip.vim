if exists("g:vim_tmux_clip_disabled")
  finish
endif
if exists("g:vim_tmux_clip_loaded")
  finish
endif
let g:vim_tmux_clip_loaded= 1

function! s:VimRegisterToTmux()
	if $TMUX=='' || exists('##TextYankPost')==1
		" not in tmux session or running under nvim
		return
	endif
	call system('tmux loadb -',@")
endfunction
command! RegisterCopyToTMux call s:VimRegisterToTmux()
