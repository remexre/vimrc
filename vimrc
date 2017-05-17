if &compatible
	set nocompatible
endif

set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/'))
	call dein#begin(expand('~/.vim/'))

	call dein#add('~/.vim/repos/github.com/Shougo/dein.vim')
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('autozimu/LanguageClient-neovim')
	call dein#add('cespare/vim-toml')
	call dein#add('ctrlpvim/ctrlp.vim')
	call dein#add('davidbeckingsale/writegood.vim')
	call dein#add('enomsg/vim-haskellConcealPlus')
	call dein#add('flazz/vim-colorschemes')
	call dein#add('jamessan/vim-gnupg')
	call dein#add('junegunn/goyo.vim')
	call dein#add('junegunn/limelight.vim')
	call dein#add('kchmck/vim-coffee-script')
	call dein#add('kovisoft/slimv')
	call dein#add('metakirby5/codi.vim')
	call dein#add('mhinz/vim-startify')
	call dein#add('reedes/vim-pencil')
	call dein#add('reedes/vim-wordy')
	call dein#add('rust-lang/rust.vim')
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('scrooloose/nerdtree')
	call dein#add('tpope/vim-fugitive')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('terryma/vim-multiple-cursors')
	call dein#add('vim-scripts/alex.vim')
	call dein#add('vim-scripts/happy.vim')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ }

nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
noremap <C-I> :NERDTreeToggle<CR>

let mapleader = "\<SPACE>"
set background=dark
set clipboard=unnamedplus
set foldmethod=syntax
set foldnestmax=1
set modeline
set mouse=a
set number
set relativenumber
set ruler
set shiftwidth=4
set showcmd
set showmatch
set showmode
set spellfile=~/cloud.acm.umn.edu/vim/spell/en.utf-8.add
set tabstop=4

colorscheme Benokai

if executable("rg")
	set grepprg=rg\ --vimgrep\ --no-heading
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

function! s:goyo_enter()
	Limelight
	PencilHard
	setlocal spell
endfunction

function! s:goyo_leave()
	Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd BufRead *.md Goyo

augroup SALTPACK
	au!
	" Make sure nothing is written to ~/.viminfo
	au BufReadPre,FileReadPre *.saltpack set viminfo=
	" No other files with unencrypted info
	au BufReadPre,FileReadPre *.saltpack set noswapfile noundofile nobackup

	" Reading Files, assumes you can decrypt
	au BufReadPost,FileReadPost *.saltpack :%!keybase decrypt 2>/dev/null

	" Writing requires users
	au BufWritePre,FileReadPre *.saltpack let usernames = input('Users: ')
	au BufWritePre,FileReadPre *.saltpack :exec "%!keybase encrypt " . usernames
	au BufWritePost,FileReadPost *.saltpack u
augroup end
