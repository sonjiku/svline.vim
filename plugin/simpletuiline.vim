" Author:	sonja-22
" Home:		https://github.com/sonjiku/simpletuiline.vim
"

" Check if plugin has been loaded
if exists("g:loaded_visimline")
  finish
endif
let g:loaded_simpletuiline = 1

"	augroup	GetGitBranch
"		autocmd!
"		autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
"	augroup END
"
"	function! StatuslineGitBranch()
"		let b:gitbranch=""
"		if &modifiable
"			try
"				let l:dir=expand('%:p:h')
"				let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
"				if !v:shell_error
"					let	b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
"				endif
"			catch
"			endtry
"		endif
"	endfunction

" This Function creates a highlight group out of the values of another
" group. It can also set text attributes, for the new group, and checks for
" empty values so vim doesn't whine when that happens and the string is for
" example 'hi Foobar ctermbg=0 ctermfg= guifg='
function! PassHLValues(child,parent,attr,ctfg,ctbg,gfg,gbg)
	if a:gfg==''
		if synIDattr(synIDtrans(hlID(a:parent)), 'fg', 'gui')==''
			let l:guifg=''
		else
			let l:guifg=' guifg=' . synIDattr(synIDtrans(hlID(a:parent)), 'fg', 'gui')
		endif
	else
			let l:guifg=' guifg=' . a:gfg
	endif

	if a:gfg==''
		if synIDattr(synIDtrans(hlID(a:parent)), 'bg', 'gui')==''
			let l:guibg=''
		else
			let l:guibg=' guibg=' . synIDattr(synIDtrans(hlID(a:parent)), 'bg', 'gui')
		endif
	else
			let l:guibg=' guibg=' . a:bfg
	endif

	if a:ctfg==''
		if synIDattr(synIDtrans(hlID(a:parent)), 'fg', 'cterm')==''
			let l:ctermfg=''
		else
			let l:ctermfg=' ctermfg=' . synIDattr(synIDtrans(hlID(a:parent)), 'fg', 'cterm')
		endif
	else
		let l:ctermfg=' ctermfg=' . a:ctfg
	endif

	if a:ctbg==''
		if synIDattr(synIDtrans(hlID(a:parent)), 'bg', 'cterm')==''
			let l:ctermbg=''
		else
			let l:ctermbg=' ctermbg=' . synIDattr(synIDtrans(hlID(a:parent)), 'bg', 'cterm')
		endif
	else
		let l:ctermbg=' ctermbg=' . a:ctbg
	endif

	if a:attr==''
		let l:guiattr=''
		let l:ctermattr=''
	else
		let l:guiattr=' gui=' . a:attr
		let l:ctermattr=' cterm=' . a:attr
	endif

	exec 'hi ' . a:child .'' . l:guifg'' . l:guibg'' . l:guiattr'' . l:ctermfg'' . l:ctermbg'' . l:ctermattr
	return ''
endfunction

	function! SetHiGroups()
		call PassHLValues('User00','StatusLine','bold','7','0','','')
		call PassHLValues('User01','SpecialKey','bold','1','0','','')
		call PassHLValues('User02','Search','bold','7','0','','')
		call PassHLValues('User03','MatchParen','bold','7','0','','')
		call PassHLValues('User04','Conditional','bold','7','0','','')
		call PassHLValues('User05','PmenuSbar','bold','7','0','','')
		call PassHLValues('User06','PreProc','bold','1','0','','')
		call PassHLValues('User07','Todo','bold','7','0','','')
		call PassHLValues('User08','MatchParen','bold','7','0','','')
		call PassHLValues('User09','ColorColumn','bold','7','0','','')
		call PassHLValues('User0A','Error','bold','1','0','','')
		call PassHLValues('User0B','PmenuSbar','bold','1','0','','')

		call PassHLValues('StuiL','StatusLine','','0','7','','')
		call PassHLValues('StuiLN','Todo','','7','2','','')
		call PassHLValues('StuiLI','Operator','','7','3','','')
		call PassHLValues('StuiLV','Conditional','','7','5','','')
		call PassHLValues('StuiLR','ErrorMsg','','7','1','','')
		call PassHLValues('StuiLT','PmenuSbar','','7','6','','')
	endfunction

	augroup	StatuslineInactive
		autocmd!
		au VimEnter,WinEnter * let w:WinAct=1
		au WinLeave * let w:WinAct=0
	augroup END

	augroup StuiL_highlightgroups
		autocmd!
		au VimEnter,WinEnter * call SetHiGroups()
	augroup END

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
				call PassHLValues('Mode','StuiLN','','7','2','','')
			elseif (mode() ==# 'i')
				call PassHLValues('Mode','StuiLI','','7','3','','')
			elseif(mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block ')
				call PassHLValues('Mode','StuiLV','','7','5','','')
			elseif (mode() =~# '\v(R|Rv)')
				call PassHLValues('Mode','StuiLR','','7','1','','')
			elseif (mode() ==# 't')
				call PassHLValues('Mode','StuiLT','','7','4','','')
			else
				call PassHLValues('Mode','StuiL','','7','6','','')
			endif
		elseif w:WinAct==0
			if (mode() ==# 'n')
				call PassHLValues('Mode','StuiLN','reverse','7','2','','')
			elseif (mode() ==# 'i')
				call PassHLValues('Mode','StuiLI','reverse','7','3','','')
			elseif(mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block ')
				call PassHLValues('Mode','StuiLV','reverse','7','5','','')
			elseif (mode() =~# '\v(R|Rv)')
				call PassHLValues('Mode','StuiLR','reverse','7','1','','')
			elseif (mode() ==# 't')
				call PassHLValues('Mode','StuiLT','reverse','7','4','','')
			else
				call PassHLValues('Mode','StuiL','reverse','7','6','','')
			endif
		endif
		return ''
	endfunction



function Visimline()
	set statusline+=\ %{toupper(g:currentmode[mode()])}
	set statusline+=%#User07#
	set statusline+=%{&paste?'\ PASTE\ ':''}%{&spell?'\ SPELL\ ':''}
	set statusline+=%#User02#
	set statusline+=\ w%{winnr()}\ 
	set statusline+=%#User02#
	set statusline+=\ b%n\ 
	set statusline+=%#User08#
	set statusline+=%#User03#
	set statusline+=\ %F\ 
	set statusline+=%=
	set statusline+=%#User0B#
	set statusline+=%r%m
	set statusline+=%#User02#
	set statusline+=\ %Y\ 
	set statusline+=%#User07#
	set statusline+=\ %3l:%-3c\ 
	set statusline+=\ %p%%\ 
endfunction
		set statusline=
		set statusline^=%{ChangeStatuslineColour()}%#Mode#
call Visimline()
