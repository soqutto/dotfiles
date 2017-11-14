" .vimrc file by soqu
" version 2016-10-18
"
" 参考: http://qiita.com/mfujimori/items/9fd41bcd8d1ce9170301

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin($HOME . "/.vim/dein")

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimshell')
call dein#add('kana/vim-submode')
"call dein#add('Lokaltog/vim-powerline')
call dein#add('itchyny/lightline.vim')
call dein#add('davidhalter/jedi-vim')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-scripts/guicolorscheme.vim')
call dein#add('altercation/vim-colors-solarized')

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ＊基本設定
" 互換モードのオフ
set nocompatible
" 文字コードをUTF-8に設定
set fenc=utf=8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読みなおす
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" ＊挙動の設定
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
" 括弧入力時に対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位で移動可能にする
nnoremap j gj
nnoremap k gk
" 折り返し時に表示行末に記号を表示する
set showbreak=↪
" 行末折り返し部分もインデントする
set breakindent
" Backspaceの有効化
set backspace=indent,eol,start

" ＊キーバインドの設定
" 入力モードで<C-h/j/k/l>のカーソル移動を有効にする
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ウィンドウ分割のキーマップ
" 参考: http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
" 元々sに割り当てられていた機能を潰す
nnoremap s <Nop>
" <C-w> [hjkl]のかわりにs[hjkl]でウィンドウ移動可能にする
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" <C-w>wで次のウィンドウに移動
nnoremap sw <C-w>w
" <C-w> [HJKL]でウィンドウ自体を移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
" タブページ移動
nnoremap sn gt
nnoremap sp gT
" ウィンドウの大きさ制御
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|
nnoremap s0 <C-w>=
" vim-submodeによるウィンドウ大きさ調整
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" バッファ移動
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
" タブページ
nnoremap st :<C-u>tabnew<CR>
"nnoremap sT :<C-u>Unite tab<CR>
" ウィンドウ分割
nnoremap ss :<C-u>split<CR>
nnoremap sv :<C-u>vsplit<CR>
" バッファ制御
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
"nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
"nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" VimShellの起動
nnoremap <Space>v :split<CR><C-w>j:VimShell<CR>

" <C-j>でノーマルモードに戻れるようにする


" ＊タブの設定
" 不可視文字を可視化
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅 (スペースn個分)
set tabstop=4
set softtabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" ＊ファイルタイプ別のインデント設定
" Pythonで#でインデント解除しない
autocmd FileType python :inoremap # X#

" ＊検索設定
" 検索文字列が小文字の場合大文字小文字の区別なく検索
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索後をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" ＊日本語入力の設定
" Escキー押下後に日本語入力をオフにする
set imdisable
" Ubuntu(mozc/Fcitx)用
" 参考: http://qiita.com/hoshitocat/items/a80d613ef73b7a06ec50
if has('unix') && executable('fcitx-remote')
    inoremap <silent> <C-[> <ESC>:call system('fcitx-remote -c')<CR>
endif

" ＊ファイルタイプ別の設定
" Python用文字コード指定テンプレート
autocmd BufNewFile *.py 0r $HOME/.vim/template/python.txt

" ＊ユーザー定義コマンドの設定
" 編集中のスクリプトを<C-e>で実行する
" 参考: http://qiita.com/smison/items/2ee7aaa88299f6972c52
" 参考: http://qiita.com/smison/items/58a18b2bb27f2eff2f2a
autocmd BufNewFile,BufRead *.rb nnoremap <F5> :!ruby %<CR>
autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python3 %<CR>
autocmd BufNewFile,BufRead *.pl nnoremap <F5> :!perl %<CR>

" ヤンクでクリップボードにコピーする
set clipboard=unnamed,autoselect


" jedi-vim用の設定
"py3(sys.path.append('/usr/local/lib/python2.7/dist-packages'))

" lightline用の設定
set laststatus=2
set t_Co=256

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
    endif
    return ''
endfunction


" Solarized用の設定
" ターミナルVim用のカラー設定
if !has('gui_running')
    let solarized_termcolors = 256
    let solarized_termtrans = 1
end
" カラー設定
let solarized_contrast='normal'
set background=light

" カラースキームの設定
colorscheme solarized

" end of .vimrc
