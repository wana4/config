"                                 _     _
"  __      ____ _ _ __   __ _ ___| |__ (_)
"  \ \ /\ / / _` | '_ \ / _` / __| '_ \| |
"   \ V  V / (_| | | | | (_| \__ \ | | | |
"    \_/\_/ \__,_|_| |_|\__,_|___/_| |_|_|


" 初期化 =======================================================================
" vi互換にしない
set nocompatible



" neobundleの設定 ==============================================================
filetype plugin indent off
if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
filetype plugin indent on

" 設定ファイルを読み込む
set runtimepath+=~/.vim/
runtime! setting.vim

" カラースキーマ
NeoBundle 'git://github.com/tomasr/molokai.git'
"NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'

" ファイラー
NeoBundle 'git://github.com/scrooloose/nerdtree.git'

" 非同期処理
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'git://github.com/Shougo/vimproc'

" ファイルセレクタ
NeoBundle 'git://github.com/kien/ctrlp.vim'
NeoBundle 'git://github.com/Shougo/unite.vim'

" シンタックスチェック
NeoBundle 'git://github.com/scrooloose/syntastic.git'

" 文字列の複数検索
" NeoBundle 'git://github.com/vim-scripts/MultipleSearch.git'

" APIライブラリ検索
" NeoBundle 'git://github.com/thinca/vim-ref.gif'

" コードの即時実行
NeoBundle 'git://github.com/thinca/vim-quickrun.git'

" DBへの接続
NeoBundle 'git://github.com/vim-scripts/dbext.vim.git'

" 補完
" NeoBundle "Shougo/neocomplcache.git"

" スニペット
" NeoBundle "Shougo/neosnippet.git"

" NeoBundle 'kana/vim-smartchr'

" java
NeoBundle "git://github.com/moznion/jcommenter.vim"

" zencoding emmet
NeoBundle "git://github.com/mattn/zencoding-vim.git"


" OS別の設定 see [:help has] " =================================================
if has("mac")
	" mac用の設定

elseif has("unix")
	" unix固有の設定

" Use ClipBoard
vnoremap <silent> sy :!pbcopy; pbpaste<CR>
noremap  <silent> sp <esc>o<esc>v:!pbpaste<CR>

elseif has("win64")
	" 64bit_windows固有の設定
elseif has("win32unix")
	" Cygwin固有の設定
elseif has("win32")
	" 32bit_windows固有の設定
endif

" ファイル設定 =================================================================
" カラースキーマ
colorscheme molokai
syntax on
" 文字エンコード
set encoding=utf-8
" 文字エンコードの認識優先度
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16,utf-16le
" 改行コード
set fileformat=unix
" 改行コードの認識優先度
set fileformats=unix,dos,mac
" 不可視文字の表示
set list
set listchars=tab:>-,trail:_,extends:<,precedes:>
" 高速ターミナル接続する
set ttyfast
" タブの表示幅
set tabstop=4
" タブ挿入の幅
set shiftwidth=4
" タブをスペースとしない
set noexpandtab
" バッファの編集を保持したまま、別バッファの展開を可能にする
set hidden
" ターミナルのカラー化
if has('unix')
	set ttytype=builtin_linux
	set term=builtin_linux
	set t_Co=256
endif
" 改行コードの認識優先度
set fileformats=unix,dos,mac
" ステータスライン
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" ステータスラインを常に表示
set laststatus=2
" コマンドを表示する
set showcmd
" 行番号を表示する
set number
" 検索を循環させない
set nowrapscan
" エラーの音を消す
set vb t_vb=
" 検索文字をハイライト
set hlsearch
" 大文字小文字を区別しない
set ic
" 全角文字の表示が潰れるのを回避
set ambiwidth=double

" コメントの自動挿入をやめる
augroup noAutoComment
	autocmd!
	autocmd FileType * setlocal fo=cq
augroup END


" キーマッピング ===============================================================
" [,]を<LEADER>にする
let mapleader = ','

" vimrc編集
nnoremap <silent> <LEADER>vim :<C-u>edit $MYVIMRC<CR>

" 行頭行末
noremap <C-a> 0
noremap <C-e> $

" 画面分割
nnoremap <LEADER>v :<C-u>vsp<CR>

" 分割画面間移動
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

" 前のバッファに移動する
nnoremap sp :<C-u>bp<CR>
" 次のバッファに移動する
nnoremap sn :<C-u>bn<CR>

" インサートモード抜ける
inoremap jk <ESC>

" ペーストモード切り替え
set pastetoggle=<C-E>

" コピーするときには表示切り替えてインデントとか入らないようにする
nnoremap <C-y> :<C-u>MyToggleSimpleDisplay<CR>

function! s:toggleSimpleDisplay()
	set number!
	set list!
endfunction
command! MyToggleSimpleDisplay call s:toggleSimpleDisplay()

" 表示行単位移動
nnoremap j gj
nnoremap k gk

" <C-l>でEscする
vnoremap <C-l> <Esc>
inoremap <C-l> <Esc>
cnoremap <C-l> <C-c>
nnoremap <C-l> <Esc>

" 誤爆防止
vnoremap u <Nop>
vnoremap U <Nop>
vnoremap gu <Nop>
vnoremap gU <Nop>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap Q <Nop>

" ノーマルモードで改行
nnoremap <CR> o<Esc>

" シフトで多めに移動
noremap J 10j
noremap K 10k
noremap L 7l
noremap H 7h

" 行マージ
vnoremap M J

" *で検索時に、いきなり移動しないように
nnoremap * *N

nnoremap ,t :!phpunit<cr>



"----------------------------------------------------------------------------
" Java
"----------------------------------------------------------------------------
augroup JavaAutoCmd
	au!
	au FileType java set shiftwidth=4 tabstop=4
	au FileType java map <C-c><C-j> :call JCommentWriter()<CR> "Set key map for jcommenter
augroup END

" Syntax highlight
let g:java_highlight_all=1
let g:java_highlight_debug=1
let g:java_allow_cpp_keywords=1
let g:java_space_errors=1
let g:java_highlight_functions=1


" nerd_tree --------------------------------------------------------------------
" カラー表示する
let g:NERDChristmasTree  = 1
" 隠しファイルを表示する
let g:NERDTreeShowHidden = 1

" ファイラ表示切替
nnoremap <silent> <LEADER>f :<C-u>NERDTreeToggle<CR>



" syntastic --------------------------------------------------------------------
" モード設定
let g:syntastic_mode_map = {
	\'mode': 'passive',
	\'active_filetypes': ['php'],
	\'passive_filetypes': [],
	\}



" MultipleSearch ---------------------------------------------------------------
" 検索
" nnoremap <silent> <LEADER>s yiw:<C-u>Search <C-R>"<CR>
" nnoremap <silent> * yiw:<C-u>Search <C-R>"<CR>

" リセット
" nnoremap <silent> <LEADER>q :<C-u>SearchReset<CR>



" vim-ref ----------------------------------------------------------------------
"php マニュアルインストールメモ
"$ cd ~/.vim/
"$ wget http://jp2.php.net/get/php_manual_en.tar.gz/from/jp.php.net/mirror
"$ tar zxvf php_manual_en.tar.gz
let g:ref_phpmanual_path=$HOME . '/.vim/php-chunked-xhtml'



" ctrlp   ----------------------------------------------------------------------
" 検索開始を現在のディレクトリからにする
let g:ctrlp_working_path_mode = 0



" unite   ----------------------------------------------------------------------
" 最近使ったファイルの一覧
noremap <C-U><C-H> :Unite file_mru<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" Unite-grep
" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
"let g:unite_source_grep_command = 'ag'
"let g:unite_source_grep_recursive_opt = ''
"let g:unite_source_grep_max_candidates = 200

nnoremap <C-U><C-G> :<C-u>Unite grep<CR><CR>



" quick-run  -------------------------------------------------------------------
" 設定情報は.vim/setting.vimに記載する
" SQLファイルの設定
let g:quickrun_config = {}
let g:quickrun_config['sql'] = {
	\ 'command': 'mysql',
	\ 'exec': ['%c %o < %s'],
	\ 'cmdopt': '%{MakeMySQLCommandOptions()}',
	\ }
function! MakeMySQLCommandOptions()
	if !exists("g:mysql_config_host")
		let g:mysql_config_host = input("host> ")
	endif
	if !exists("g:mysql_config_port")
		let g:mysql_config_port = input("port> ")
	endif
	if !exists("g:mysql_config_user")
		let g:mysql_config_user = input("user> ")
	endif
	if !exists("g:mysql_config_pass")
		let g:mysql_config_pass = inputsecret("password> ")
	endif
	if !exists("g:mysql_config_db")
		let g:mysql_config_db = input("database> ")
	endif

	let optlist = []
	if g:mysql_config_user != ''
		call add(optlist, '-u ' . g:mysql_config_user)
	endif
	if g:mysql_config_host != ''
		call add(optlist, '-h ' . g:mysql_config_host)
	endif
	if g:mysql_config_pass != ''
		call add(optlist, '-p' . g:mysql_config_pass)
	endif
	if g:mysql_config_port != ''
		call add(optlist, '-P ' . g:mysql_config_port)
	endif
	if exists("g:mysql_config_otheropts")
		call add(optlist, g:mysql_config_otheropts)
	endif

	call add(optlist, g:mysql_config_db)
	return join(optlist, ' ')
endfunction



" dbext  -------------------------------------------------------------------
" 設定情報は.vim/setting.vimに記載する

" 実行結果は上に、30行出す。
let g:dbext_default_buffer_lines = 30
let g:dbext_default_window_use_bottom = 0


" neocomplcache ------------------------------------------------------------
" 参考) http://vim-users.jp/2010/10/hack177/

" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Use camel case completion.
" let g:neocomplcache_enable_camel_case_completion = 1
" " Use underbar completion.
" let g:neocomplcache_enable_underbar_completion = 1
" " Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
" 
" " Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
" 	\ 'default' : '',
" 	\ 'vimshell' : $HOME.'/.vimshell_hist',
" 	\ 'scheme' : $HOME.'/.gosh_completions'
" 	\ }
" 
" " Define keyword.
" if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" 
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neocomplcache_snippets_expand)
" smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
" 
" inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
" 
" inoremap <expr><C-y> neocomplcache#close_popup()
" inoremap <expr><C-e> neocomplcache#cancel_popup()
" 
" 
" " NeoSnippet
" 
" " スニペットを展開する。スニペットが関係しないところでは行末まで削除
" imap <expr><C-k> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-o>D"
" smap <expr><C-k> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-o>D"
" 
" let g:neosnippet#snippets_directory='~/Dropbox/vim/snippet'
" let g:neosnippet#disable_runtime_snippets = {
" \   'php' : 1,
" \ }


" smartctr
" inoremap <buffer><expr> = smartchr#one_of(' = ', ' == ', '=')

