"Author: sonja-22
"
if !(exists("g:enable_simpletuiline") && g:enable_simpletuiline == 0)

	if exists("g:loaded_simpletuiline")
	  finish
	endif
	let g:loaded_simpletuiline = 1


	au VimEnter * let w:WinAct=1
	au WinLeave * let w:WinAct=0
	au WinEnter * let w:WinAct=1

	let g:currentmode={
		\ 'n'	:	'Normal ',
		\ 'no'	:	'N·Operator Pending ',
		\ 'v'	:	'Visual ',
		\ 'V'	:	'V·Line ',
		\ ''	:	'V·Block ',
		\ 's'	:	'Select ',
		\ 'S'	:	'S·Line ',
		\ ''	:	'S·Block ',
		\ 'i'	:	'Insert ',
		\ 'R'	:	'Replace ',
		\ 'Rv'	:	'V·Replace ',
		\ 'c'	:	'Command ',
		\ 'cv'	:	'Vim Ex ',
		\ 'ce'	:	'Ex ',
		\ 'r'	:	'Prompt ',
		\ 'rm'	:	'More ',
		\ 'r?'	:	'Confirm ',
		\ '!'	:	'Shell ',
		\ 't'	:	'Terminal '
		\}

	function! ChangeStatuslineColour()
		if w:WinAct==1
			if (mode() ==# 'n')
					hi Statusline cterm=bold ctermbg=3 ctermfg=15
			elseif(mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block ')
					hi Statusline cterm=bold ctermbg=5 ctermfg=15
			elseif (mode() ==# 'i')
					hi Statusline cterm=bold ctermbg=2 ctermfg=15
			elseif (mode() =~# '\v(R|Rv)')
					hi Statusline cterm=bold ctermbg=1 ctermfg=15
			elseif (mode() ==# 't')
					hi Statusline cterm=bold ctermbg=6 ctermfg=15
			else
					hi Statusline cterm=bold ctermbg=7 ctermfg=0
			endif
		elseif w:WinAct==0
			if (mode() ==# 'n')
					hi Statusline cterm=Reverse ctermbg=3 ctermfg=15
			elseif(mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block ')
					hi Statusline cterm=Reverse ctermbg=5 ctermfg=15
			elseif (mode() ==# 'i')                                 
					hi Statusline cterm=Reverse ctermbg=2 ctermfg=15
			elseif (mode() =~# '\v(R|Rv)')                          
					hi Statusline cterm=Reverse ctermbg=1 ctermfg=15
			elseif (mode() ==# 't')                                 
					hi Statusline cterm=Reverse ctermbg=6 ctermfg=15
			else                                                    
					hi Statusline cterm=Reverse ctermbg=7 ctermfg=0
			endif
		endif

		hi User01 cterm=NONE ctermbg=0 ctermfg=1
		hi User02 cterm=NONE ctermbg=0 ctermfg=2
		hi User03 cterm=NONE ctermbg=0 ctermfg=3
		hi User04 cterm=NONE ctermbg=0 ctermfg=4
		hi User05 cterm=NONE ctermbg=0 ctermfg=5
		hi User06 cterm=NONE ctermbg=0 ctermfg=6
		hi User07 cterm=NONE ctermbg=0 ctermfg=7
		hi User08 cterm=NONE ctermbg=0 ctermfg=8
		hi User09 cterm=NONE ctermbg=0 ctermfg=9
		hi User0A cterm=NONE ctermbg=0 ctermfg=10
		hi User0B cterm=NONE ctermbg=0 ctermfg=11
		hi User0C cterm=NONE ctermbg=0 ctermfg=12
		hi User0D cterm=NONE ctermbg=0 ctermfg=13
		hi User0E cterm=NONE ctermbg=0 ctermfg=14
		hi User0F cterm=NONE ctermbg=0 ctermfg=15
		hi User74 cterm=NONE ctermbg=7 ctermfg=4
		hi UserF4 cterm=NONE ctermbg=15 ctermfg=4

		return ''
	endfunction

	function! Statline()
		set statusline+=\ %{toupper(g:currentmode[mode()])}
		set statusline+=%#UserF4#%{&paste?'\ PASTE\ ':''}%{&spell?'\ SPELL\ ':''}
		set statusline+=%#User0C#\ %{winnr()}\ 
		set statusline+=%#User08#\|
		set statusline+=%#User09#\ %n\ 
		set statusline+=%#User08#\|
		set statusline+=%#User03#\ %F\ 
		set statusline+=%#User0B#%r%m
		set statusline+=%=
		set statusline+=%#User02#\ %Y\ 
		set statusline+=%#User06#\|
		set statusline+=%#User04#
		set statusline+=\ %3l:%-3c\ 
		set statusline+=\ %p%%\ 
		return ''
	endfunction


		let g:enable_simpletuiline=1
		set statusline=
		set statusline^=%{ChangeStatuslineColour()}%#Statusline#
		call Statline()
endif
