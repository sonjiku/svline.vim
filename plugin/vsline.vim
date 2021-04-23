" Author:	sonja-22
" Home:		https://github.com/sonjiku/svline.vim "
" Check if plugin has been loaded if exists("g:loaded_svline")
if exists("g:loaded_svline")
  finish
endif
let g:loaded_svline = 1


augroup	StatuslineInactive
	autocmd!
	au VimEnter,WinEnter * let w:WinAct=1
	au WinLeave * let w:WinAct=0
augroup END

" This Function creates a highlight group out of the values of another " group. It can also set text attributes, for the new group, and checks for
" empty values so vim doesn't whine when that happens and the string is for
" example 'hi Foobar ctermbg=0 ctermfg= guifg='
function! PassHLValues(child,parent,attr,ctfg,ctbg,gfg,gbg)
	if a:attr==''
		let l:guiattr=''
		let l:ctermattr=''
	else
		let l:guiattr=' gui=' . a:attr
		let l:ctermattr=' cterm=' . a:attr
	endif

	if hlexists(a:child) && synIDattr(synIDtrans(hlID(a:child)), 'fg', 'cterm')!=''
			let l:ctermfg=' ctermfg=' . synIDattr(synIDtrans(hlID(a:child)), 'fg', 'cterm')
	else
			if a:ctfg==''
				if synIDattr(synIDtrans(hlID(a:parent)), 'fg', 'cterm')==''
					let l:ctermfg=''
				else
					let l:ctermfg=' ctermfg=' . synIDattr(synIDtrans(hlID(a:parent)), 'fg', 'cterm')
				endif
			else
				if a:ctfg=='none'
					let l:ctermfg=''
				else
					let l:ctermfg=' ctermfg=' . a:ctfg
				endif
			endif
	endif

	if hlexists(a:child) && synIDattr(synIDtrans(hlID(a:child)), 'bg', 'cterm')!=''
			let l:ctermbg=' ctermbg=' . synIDattr(synIDtrans(hlID(a:child)), 'bg', 'cterm')
	else
			if a:ctbg==''
				if synIDattr(synIDtrans(hlID(a:parent)), 'bg', 'cterm')==''
					let l:ctermbg=''
				else
					let l:ctermbg=' ctermbg=' . synIDattr(synIDtrans(hlID(a:parent)), 'bg', 'cterm')
				endif
			else
				if a:ctbg=='none'
					let l:ctermbg=''
				else
					let l:ctermbg=' ctermbg=' . a:ctbg
				endif
			endif
	endif

	if hlexists(a:child) && synIDattr(synIDtrans(hlID(a:child)), 'fg', 'gui')!=''
		let l:guifg=' guifg=' . synIDattr(synIDtrans(hlID(a:child)), 'fg', 'gui')
	else
		if a:gfg==''
			if synIDattr(synIDtrans(hlID(a:parent)), 'fg', 'gui')==''
				let l:guifg=''
			else
				let l:guifg=' guifg=' . synIDattr(synIDtrans(hlID(a:parent)), 'fg', 'gui')
			endif
		else
				let l:guifg=' guifg=' . a:gfg
		endif
	endif

	if hlexists(a:child) && synIDattr(synIDtrans(hlID(a:child)), 'bg', 'gui')!=''
		let l:guibg=' guibg=' . synIDattr(synIDtrans(hlID(a:child)), 'bg', 'gui')
	else
		if a:gbg==''
			if synIDattr(synIDtrans(hlID(a:parent)), 'bg', 'gui')==''
				let l:guibg=''
			else
				let l:guibg=' guibg=' . synIDattr(synIDtrans(hlID(a:parent)), 'bg', 'gui')
			endif
		else
				let l:guibg=' guibg=' . a:gbg
		endif
	endif

	exec 'hi ' . a:child .'' . l:guifg'' . l:guibg'' . l:guiattr'' . l:ctermfg'' . l:ctermbg'' . l:ctermattr
	return ''
endfunction


if g:colors_name=="gruvbox"
	function! SetHiGroups()
		"Normal BackGround
		call PassHLValues('svLineFg00Bg00','GruvboxBg0','bold','0','none','','NONE')
		call PassHLValues('svLineFg00Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg01Bg00','GruvboxRed','bold','1','','','NONE')
		call PassHLValues('svLineFg01Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg02Bg00','GruvboxGreen','bold','2','','','NONE')
		call PassHLValues('svLineFg02Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg03Bg00','GruvboxYellow','bold','3','','','NONE')
		call PassHLValues('svLineFg03Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg04Bg00','GruvboxBlue','bold','4','','','NONE')
		call PassHLValues('svLineFg04Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg05Bg00','GruvboxPurple','bold','5','','','NONE')
		call PassHLValues('svLineFg05Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg06Bg00','GruvboxAqua','bold','6','','','NONE')
		call PassHLValues('svLineFg06Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg07Bg00','GruvboxBg3','bold','7','','','NONE')
		call PassHLValues('svLineFg07Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg08Bg00','GruvboxGray','bold','8','','','NONE')
		call PassHLValues('svLineFg08Bg00','Normal','bold','none','0','NONE','')
		"Background Shade 1
		call PassHLValues('svLineFg00Bg00s1','GruvboxBg0','bold','0','none','','NONE')
		call PassHLValues('svLineFg00Bg00s1','CursorLine','bold','none','0','NONE','')
		call PassHLValues('svLineFg01Bg00s1','GruvboxRed','bold','1','','','NONE')
		call PassHLValues('svLineFg01Bg00s1','CursorLine','bold','none','0','NONE','')
		call PassHLValues('svLineFg02Bg00s1','GruvboxGreen','bold','2','','','NONE')
		call PassHLValues('svLineFg02Bg00s1','CursorLine','bold','none','0','NONE','')
		call PassHLValues('svLineFg03Bg00s1','GruvboxYellow','bold','3','','','NONE')
		call PassHLValues('svLineFg03Bg00s1','CursorLine','bold','none','0','NONE','')
		call PassHLValues('svLineFg04Bg00s1','GruvboxBlue','bold','4','','','NONE')
		call PassHLValues('svLineFg04Bg00s1','CursorLine','bold','none','0','NONE','')
		call PassHLValues('svLineFg05Bg00s1','GruvboxPurple','bold','5','','','NONE')
		call PassHLValues('svLineFg05Bg00s1','CursorLine','bold','none','0','NONE','')
		call PassHLValues('svLineFg06Bg00s1','GruvboxAqua','bold','6','','','NONE')
		call PassHLValues('svLineFg06Bg00s1','CursorLine','bold','none','0','NONE','')
		call PassHLValues('svLineFg07Bg00s1','GruvboxBg3','bold','7','','','NONE')
		call PassHLValues('svLineFg07Bg00s1','CursorLine','bold','none','0','NONE','')
		call PassHLValues('svLineFg08Bg00s1','GruvboxGray','bold','8','','','NONE')
		call PassHLValues('svLineFg08Bg00s1','CursorLine','bold','none','0','NONE','')
		"Background Shade 2
		call PassHLValues('svLineFg00Bg00s2','GruvboxBg0','bold','0','none','','NONE')
		call PassHLValues('svLineFg00Bg00s2','PmenuSbar','bold','none','0','NONE','')
		call PassHLValues('svLineFg01Bg00s2','GruvboxRed','bold','1','','','NONE')
		call PassHLValues('svLineFg01Bg00s2','PmenuSbar','bold','none','0','NONE','')
		call PassHLValues('svLineFg02Bg00s2','GruvboxGreen','bold','2','','','NONE')
		call PassHLValues('svLineFg02Bg00s2','PmenuSbar','bold','none','0','NONE','')
		call PassHLValues('svLineFg03Bg00s2','GruvboxYellow','bold','3','','','NONE')
		call PassHLValues('svLineFg03Bg00s2','PmenuSbar','bold','none','0','NONE','')
		call PassHLValues('svLineFg04Bg00s2','GruvboxBlue','bold','4','','','NONE')
		call PassHLValues('svLineFg04Bg00s2','PmenuSbar','bold','none','0','NONE','')
		call PassHLValues('svLineFg05Bg00s2','GruvboxPurple','bold','5','','','NONE')
		call PassHLValues('svLineFg05Bg00s2','PmenuSbar','bold','none','0','NONE','')
		call PassHLValues('svLineFg06Bg00s2','GruvboxAqua','bold','6','','','NONE')
		call PassHLValues('svLineFg06Bg00s2','PmenuSbar','bold','none','0','NONE','')
		call PassHLValues('svLineFg07Bg00s2','GruvboxBg3','bold','7','','','NONE')
		call PassHLValues('svLineFg07Bg00s2','PmenuSbar','bold','none','0','NONE','')
		call PassHLValues('svLineFg08Bg00s2','GruvboxGray','bold','8','','','NONE')
		call PassHLValues('svLineFg08Bg00s2','PmenuSbar','bold','none','0','NONE','')
		"Background Shade 3
		call PassHLValues('svLineFg00Bg00s3','GruvboxBg0','bold','0','none','','NONE')
		call PassHLValues('svLineFg00Bg00s3','MatchParen','bold','none','0','NONE','')
		call PassHLValues('svLineFg01Bg00s3','GruvboxRed','bold','1','','','NONE')
		call PassHLValues('svLineFg01Bg00s3','MatchParen','bold','none','0','NONE','')
		call PassHLValues('svLineFg02Bg00s3','GruvboxGreen','bold','2','','','NONE')
		call PassHLValues('svLineFg02Bg00s3','MatchParen','bold','none','0','NONE','')
		call PassHLValues('svLineFg03Bg00s3','GruvboxYellow','bold','3','','','NONE')
		call PassHLValues('svLineFg03Bg00s3','MatchParen','bold','none','0','NONE','')
		call PassHLValues('svLineFg04Bg00s3','GruvboxBlue','bold','4','','','NONE')
		call PassHLValues('svLineFg04Bg00s3','MatchParen','bold','none','0','NONE','')
		call PassHLValues('svLineFg05Bg00s3','GruvboxPurple','bold','5','','','NONE')
		call PassHLValues('svLineFg05Bg00s3','MatchParen','bold','none','0','NONE','')
		call PassHLValues('svLineFg06Bg00s3','GruvboxAqua','bold','6','','','NONE')
		call PassHLValues('svLineFg06Bg00s3','MatchParen','bold','none','0','NONE','')
		call PassHLValues('svLineFg07Bg00s3','GruvboxBg3','bold','7','','','NONE')
		call PassHLValues('svLineFg07Bg00s3','MatchParen','bold','none','0','NONE','')
		call PassHLValues('svLineFg08Bg00s3','GruvboxGray','bold','8','','','NONE')
		call PassHLValues('svLineFg08Bg00s3','MatchParen','bold','none','0','NONE','')

		call PassHLValues('svLine','GruvboxFg1','bold,reverse','7','0','','')
		call PassHLValues('svLineN','GruvboxGreen','bold,reverse','2','0','','')
		call PassHLValues('svLineI','GruvboxYellow','bold,reverse','3','0','','')
		call PassHLValues('svLineV','GruvboxPurple','bold,reverse','5','0','','')
		call PassHLValues('svLineR','GruvboxRed','bold,reverse','1','0','','')
		call PassHLValues('svLineT','GruvboxAqua','bold,reverse','6','0','','')
		call PassHLValues('svLinenc','svLine','bold','7','0','','')
		call PassHLValues('svLineNnc','svLineN','bold','2','0','','')
		call PassHLValues('svLineInc','svLineI','bold','3','0','','')
		call PassHLValues('svLineVnc','svLineV','bold','5','0','','')
		call PassHLValues('svLineRnc','svLineR','bold','1','0','','')
		call PassHLValues('svLineTnc','svLineT','bold','6','0','','')
	endfunction
else
	function! SetHiGroups()
		call PassHLValues('svLineFg00Bg00','Normal','bold','0','none','','NONE')
		call PassHLValues('svLineFg00Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg01Bg00','WarningMsg','bold','1','','','NONE')
		call PassHLValues('svLineFg01Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg02Bg00','MoreMsg','bold','2','','','NONE')
		call PassHLValues('svLineFg02Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg03Bg00','Statement','bold','3','','','NONE')
		call PassHLValues('svLineFg03Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg04Bg00','Comment','bold','4','','','NONE')
		call PassHLValues('svLineFg04Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg05Bg00','Constant','bold','5','','','NONE')
		call PassHLValues('svLineFg05Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg06Bg00','Identifier','bold','6','','','NONE')
		call PassHLValues('svLineFg06Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg07Bg00','Normal','bold','7','','','NONE')
		call PassHLValues('svLineFg07Bg00','Normal','bold','none','0','NONE','')
		call PassHLValues('svLineFg08Bg00','Conceal','bold','8','','','NONE')
		call PassHLValues('svLineFg08Bg00','Normal','bold','none','0','NONE','')

		call PassHLValues('svLine','StatusLine','bold','0','7','','')
		call PassHLValues('svLineN','Todo','bold','0','2','','')
		call PassHLValues('svLineI','Operator','bold','0','3','','')
		call PassHLValues('svLineV','Conditional','bold','0','5','','')
		call PassHLValues('svLineR','ErrorMsg','bold','0','1','','')
		call PassHLValues('svLineT','PmenuSbar','bold','0','6','','')
		call PassHLValues('svLinenc','StatusLine','bold','0','7','','')
		call PassHLValues('svLineNnc','Todo','bold','2','0','','')
		call PassHLValues('svLineInc','Operator','bold','3','0','','')
		call PassHLValues('svLineVnc','Conditional','bold','5','0','','')
		call PassHLValues('svLineRnc','ErrorMsg','bold','1','0','','')
		call PassHLValues('svLineTnc','PmenuSbar','bold','6','0','','')
	endfunction
endif

call SetHiGroups()

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
			hi link svLineMode svLineN
			hi link svLineModeNC svLineNnc
		elseif (mode() ==# 'i')
			hi link svLineMode svLineI
			hi link svLineModeNC svLineInc
		elseif(mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block ')
			hi link svLineMode svLineV
			hi link svLineModeNC svLineVnc
		elseif (mode() =~# '\v(R|Rv)')
			hi link svLineMode svLineR
			hi link svLineModeNC svLineRnc
		elseif (mode() ==# 't')
			hi link svLineMode svLineT
			hi link svLineModeNC svLineTnc
		else
			hi link svLineMode svLine
			hi link svLineModeNC svLinenc
		endif
	elseif w:WinAct==0
		if (mode() ==# 'n')
			hi link svLineMode svLineNnc
			hi link svLineModeNC svLineNnc
		elseif (mode() ==# 'i')
			hi link svLineMode svLineInc
			hi link svLineModeNC svLineInc
		elseif(mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block ')
			hi link svLineMode svLineVnc
			hi link svLineModeNC svLineVnc
		elseif (mode() =~# '\v(R|Rv)')
			hi link svLineMode svLineRnc
			hi link svLineModeNC svLineRnc
		elseif (mode() ==# 't')
			hi link svLineMode svLineTnc
			hi link svLineModeNC svLineTnc
		else
			hi link svLineMode svLinenc
			hi link svLineModeNC svLinenc
		endif
	endif
	return ''
endfunction

function Svline()
		set statusline+=\ %{toupper(g:currentmode[mode()])}
	if g:colors_name=="gruvbox"
		set statusline+=%#svLineFg05Bg00s1#
	else
		set statusline+=%#svLineFg05Bg00#
	endif
		set statusline+=\ W%{winnr()}
	if g:colors_name=="gruvbox"
		set statusline+=%#svLineFg07Bg00s1#
	else
		set statusline+=%#svLineFg07Bg00#
	endif
		set statusline+=\|
	if g:colors_name=="gruvbox"
		set statusline+=%#svLineFg05Bg00s1#
	else
		set statusline+=%#svLineFg05Bg00#
	endif
		set statusline+=B%n\ 
	if g:colors_name=="gruvbox"
		set statusline+=%#svLineFg03Bg00s2#
	else
		set statusline+=%#svLineFg03Bg00#
	endif
		set statusline+=\ %F\ 
	if g:colors_name=="gruvbox"
		set statusline+=%#svLineFg01Bg00s2#
	else
		set statusline+=%#svLineFg01Bg00#
	endif
		set statusline+=%r
	if g:colors_name=="gruvbox"
		set statusline+=%#svLineFg04Bg00s2#
	else
		set statusline+=%#svLineFg04Bg00#
	endif
		set statusline+=%m
		set statusline+=%=
	if g:colors_name=="gruvbox"
		set statusline+=%#svLineFg06Bg00s1#
	else
		set statusline+=%#svLineFg06Bg00#
	endif
		set statusline+=\ %Y\ 
		set statusline+=%#svLineMode#
		set statusline+=\ %3p%%\ 
		set statusline+=%#svLineMode#
		set statusline+=\ %3l:%-3c\ 
endfunction

set statusline=
set statusline^=%{ChangeStatuslineColour()}%#svLineMode#
call Svline()
