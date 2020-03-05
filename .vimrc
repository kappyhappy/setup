" run installer.sh before execution
" https://github.com/Shougo/dein.vim
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh ./installer.sh ~/.cache/dein

if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  if executable('go')
    call dein#add('fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' })
    if has('nvim')
      call dein#add('nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' })
    else
      call dein#add('nsf/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' })
    endif
  endif

  call dein#add('hashivim/vim-terraform')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" keyboard mapping
" nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" nnoremap sJ <C-w>J
" nnoremap sK <C-w>K
" nnoremap sL <C-w>L
" nnoremap sH <C-w>H
" nnoremap sn gt
" nnoremap sp gT
" nnoremap sr <C-w>r
" nnoremap s= <C-w>=
" nnoremap sw <C-w>w
" nnoremap so <C-w>_<C-w>|
" nnoremap sO <C-w>=
" nnoremap sN :<C-u>bn<CR>
" nnoremap sP :<C-u>bp<CR>
" nnoremap st :<C-u>tabnew<CR>
" nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" nnoremap sQ :<C-u>bd<CR>
" nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
" nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

nnoremap qw :<C-u>w<CR>
nnoremap qq :<C-u>q!<CR>
nnoremap QQ :<C-u>wq<CR>

nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-]> g<C-]>

nnoremap <silent>mp :PrevimOpen<CR>

" colorscheme
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
syntax on

" save clipboard when yanked
set clipboard=unnamed
" display row number
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine
set number

" search
set ignorecase
set smartcase
set hlsearch

" display unvisible letters
set backspace=indent,eol,start

" display unvisible letters
set list

" keep undo
set undofile 
set undodir=$HOME/.vim/undo
set undolevels=1000 
set undoreload=10000 

" check tags directroy in the upper level
set tags=tags;,.tags;ctags;,.ctags;

" Auto Commands {{{

" Highlight line if in insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" git commit messages
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73

" Shell files
autocmd BufNewFile,BufRead *.rc,*.sh set ft=sh
autocmd FileType sh set ts=2 sw=2 et smartindent

" Ruby
autocmd BufNewFile,BufRead *.rake,*.mab,*.ru set ft=ruby
autocmd BufNewFile,BufRead *.erb set ft=eruby
autocmd BufNewFile,BufRead *.rub set ft=eruby
autocmd BufNewFile,BufRead .irbrc,.pryrc,Capfile,Gemfile,Rakefile,Vagrantfile,Puppetfile set ft=ruby
autocmd FileType ruby,eruby set ts=2 sw=2 tw=79 et sts=2 smartindent

" Python
autocmd BufNewFile,BufRead .py set ft=python
autocmd FileType python set ts=4 sw=4 tw=160 et sts=4 smartindent

" JavaScript
autocmd BufNewFile,BufRead *.js set ft=javascript
autocmd FileType javascript set ts=2 sw=2 tw=79 et sts=2 smartindent

" Go
autocmd BufRead,BufNewFile *.go set ft=go
autocmd FileType go set ts=4 sw=4 tw=160 et sts=4 smartindent

" JSON
autocmd BufNewFile,BufRead *.json,*.json.j2 set ft=json
autocmd FileType json set ts=2 sw=2 et sts=2 smartindent
" let g:vim_json_syntax_conceal = 0

" YAML
autocmd BufNewFile,BufRead *.yaml,*.yml.j2,*.yaml.j2,*.yml.j2 set ft=yaml
autocmd FileType yaml set ts=2 sw=2 et sts=2 smartindent

" nginx
autocmd BufRead,BufNewFile */etc/nginx/* set ft=nginx ts=4 sw=4 sts=4 et smartindent
autocmd FileType nginx set commentstring=#\ %s

" Markdown Preview
autocmd BufRead,BufNewFile *.md set ft=markdown

" terraform
autocmd BufRead,BufNewFile *.tf set ft=terraform
autocmd FileType terraform set ts=2 sw=2 tw=79 et sts=2 smartindent

" vim-gitgutter
let g:gitgutter_map_keys = 0

" Markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'

" Auto run terraform fmt on save
let g:terraform_fmt_on_save = 1

