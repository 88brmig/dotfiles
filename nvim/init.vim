call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'ayu-theme/ayu-vim'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'css', 'json', 'graphql'] }
Plug 'mxw/vim-jsx'
Plug 'neovim/nvim-lspconfig'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'voronkovich/ctrlp-nerdtree.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'flowtype/vim-flow'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'jparise/vim-graphql'
Plug 'onsails/lspkind-nvim'
Plug 'elzr/vim-json'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/goyo.vim'
Plug 'rakr/vim-one'
Plug 'hrsh7th/nvim-cmp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
call plug#end()
syntax on

" COLORSCHEME 
set t_Co=256
" FOR LIGHT
" colorscheme one
" set background=light
" let g:airline_theme='one'
" let g:one_allow_italics = 1

" FOR DARK
colorscheme ayu 
" set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme

highlight Comment cterm=italic
if (has("termguicolors"))
  set termguicolors
endif

set guifont=Ubuntu\ Mono\ 11
set noswapfile
" LINTER SETTINGS
" ------------------------------------------------

" let g:ale_fixers = {
" \ 'javascript': ['eslint']
" \ }


" let g:ale_sign_error = '@'
" let g:ale_sign_warning = '!!'

" let g:ale_fix_on_save = 0
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_text_change = 'never'


" NERDTree
" -----------------------------------------------

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "??? ",
    \ "Staged"    : "??? ",
    \ "Untracked" : "??? ",
    \ "Renamed"   : "??? ",
    \ "Unmerged"  : "??? ",
    \ "Deleted"   : "??? ",
    \ "Dirty"     : "??? ",
    \ "Clean"     : "?????? ",
    \ 'Ignored'   : '??? ',
    \ "Unknown"   : "? "
    \ }

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

let NERDTreeShowHidden=0
 function! StartUp()
  if 0 == argc()
    Startify
    NERDTree /var/www
  end
endfunction
autocmd VimEnter * call StartUp()

" Show hidden files
let g:ctrlp_show_hidden = 1
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" CTRL-P
" --------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" --------------------------------------------------
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set scrolloff=8
set number               
set relativenumber
set encoding=UTF-8
set expandtab
set shiftwidth=2
set softtabstop=2

let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.htm PrettierAsync

" Key shortcuts
" ------------------------------------------------
nnoremap <F2> :buffers<CR>:buffer<Space>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap ?? i
map <F8> ggVG
map <C-S-l> :Prettier<CR>
map <F3> :NERDTreeToggle<CR>
map <F12> :ALEGoToDefinition<CR>

autocmd GuiEnter * silent NERDTree
autocmd VimEnter * silent NERDTree

"-- AUTOCOMPLETION --"
filetype plugin on
set omnifunc=syntaxcomplete#Complete


" Highlight currently open buffer in NERDTree
utocmd BufEnter * call SyncTree()

" comment out: 
" - gcc to commentout single line
" - gc to commentout the target of a motion

hi Normal guibg=NONE ctermbg=NONE
