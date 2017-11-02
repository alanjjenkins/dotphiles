" TODO: http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/225852#225852
" Setting up vim plug"{{{
let vimPlugNOTInstalled=1
let vimPlugURI='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after/

  let vimplugpath=expand('$HOME/.vim/autoload/plug.vim')
  if !filereadable(vimplugpath)
    echo "Installing vim-plug.."
    echo ""
    silent :exe '!mkdir -p ' . $HOME .'\.vim\autoload'
    silent :exe "!powershell -command \"(New-Object Net.WebClient).DownloadFile(\\\"" . vimPlugURI . "\\\", \\\"" . vimplugpath . "\\\")\""
    let vimPlugNOTInstalled=0
  endif
else
  let vimplugpath=expand('~/.vim/autoload/plug.vim')
  if !filereadable(vimplugpath)
    echo "Installing vim-plug.."
    echo ""
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vimPlugNOTInstalled=0
  endif
endif"}}}
" Plugins " {{{
filetype off
call plug#begin()
" {{{ Disabled plugins
" Plug 'LustyJuggler'
" Plug 'Raimondi/delimitMate'
" Plug 'Shougo/neocomplete' " enhanced completion
" Plug 'Shougo/neosnippet' " vimscript base snippets.
" Plug 'Shougo/neosnippet-snippets' " snippets for neosnippet
" Plug 'Townk/vim-autoclose'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --system-boost --gocode-completer --tern-completer --racer-completer' }
" Plug 'bling/vim-bufferline'
" Plug 'davidoc/taskpaper.vim' " Taskpaper todo.txt syntax plugin for vim.
" Plug 'docker/docker', { 'rtp': '/contrib/syntax/vim/' } " Dockerfile syntax support.
" Plug 'freitass/todo.txt-vim'
" Plug 'garbas/vim-snipmate'
" Plug 'gmarik/snipmate.vim'
" Plug 'mivok/vimtodo'
" Plug 'myint/syntastic-extras'
" Plug 'plasticboy/vim-markdown' " Adds Markdown syntax for the original markdown syntax
" Plug 'puppetlabs/puppet-syntax-vim'
" Plug 'python-mode/python-mode'
" Plug 'rafaqz/ranger.vim'
" Plug 'scrooloose/syntastic'
" Plug 'sjl/gundo.vim' " A graphical undo history. Toggle with :GundoToggle (mapped to F5)
" Plug 'snipmate'
" Plug 'spf13/vim-preview' " Opens a preview of the current HTML file in your browser.
" Plug 'svermeulen/vim-easyclip'
" Plug 'thinca/vim-poslist' " A more detailed jumplist.
" Plug 'tomtom/tlib_vim'
" Plug 'tomtom/ttodo_vim'
" Plug 'tpope/vim-markdown' " Adds Markdown syntax support.
" Plug 'tpope/vim-ragtag' " Adds some mapping sfor working with HTML, XML, PHP, ASP, eRuby and JSP.
" Plug 'tpope/vim-rhubarb' " A github extension to fugitive. Enables :Gbrowse to browse github urls.
" Plug 'tpope/vim-vinegar'
" Plug 'vim-scripts/hexman'
" Plug 'tpope/vim-sleuth' " Automatically detects the indentation settings of the current file and adjusts shiftwidth and expandtab to match.
" Plug 'altercation/vim-colors-solarized'              " solarized colour theme.
" Plug 'christoomey/vim-system-copy'                   " Adds cp normal mode command for copying to the system clipboard works with motions to select text.
" Plug 'luochen1990/rainbow'                           " Adds 'rainbow' parenthesis (colour codes them to easier see matching pairs)
" Plug 'reedes/vim-pencil'                             " Adds various tweaks to improve Vim for writing documentation. (disabled as it kept wrapping things it should not).
" Plug 'ajh17/VimCompletesMe'                          " minimalistic vimscript auto completion. (disabled because switched to Neocomplete).
" }}}
" {{{ Syntax plugins
Plug 'LaTeX-Box-Team/LaTeX-Box' " Syntax for Latex with improved mappings and motions and auto background compilation of changes.
Plug 'Matt-Deacalion/vim-systemd-syntax' " systemd syntax support
Plug 'StanAngeloff/php.vim' " php syntax support.
Plug 'aaronbieber/vim-quicktask' " A task / project management plugin for Vim.
Plug 'burnettk/vim-angular' " AngularJS syntax support
Plug 'chase/vim-ansible-yaml' " Ansible yaml syntax support.
Plug 'chr4/nginx.vim' " Nginx config file syntax.
Plug 'chrisbra/csv.vim' " Enhanced CSV file editing plugin (CSV syntax and mappings).
Plug 'chrisyip/Better-CSS-Syntax-for-Vim' " Adds CSS3 syntax support.
Plug 'dbeniamine/todo.txt-vim' " todo.txt syntax plugin for vim.
Plug 'digitaltoad/vim-pug' " Pug templating engine syntax support.
Plug 'ekalinin/Dockerfile.vim' " Dockerfile syntax and Snipmate snippets for Dockerfile.
Plug 'elzr/vim-json' " Improved editing of JSON files (syntax).
Plug 'evidens/vim-twig' " Twig template engine syntax.
Plug 'groenewege/vim-less' " Syntax support for the LESS CSS preprocessor.
Plug 'hashivim/vim-terraform' " Terraform syntax support.
Plug 'jtratner/vim-flavored-markdown' " Github flavoured Markdown syntax support.
Plug 'lepture/vim-jinja' " Jinja2 syntax support
Plug 'm-kat/aws-vim' " Adds auto completion for Cloudformation templates and improves syntax highlighting.
Plug 'mhinz/vim-hugefile' " Disables Filetype autocmds, syntax highlighting, folding, swapfiles, MatchParen for files bigger than 2MB to ensure that Vim opens them quickly.
Plug 'mustache/vim-mustache-handlebars' " Adds mustache and handlebars templating syntax.
Plug 'mxw/vim-jsx'              " Syntax plugin for editing JSX files.
Plug 'othree/javascript-libraries-syntax.vim' " Adds syntax support for various Javascript libraries.
Plug 'pangloss/vim-javascript' " Javascript syntax file with improved indentation support.
Plug 'rodjek/vim-puppet' " Adds Puppet syntax, formatting guides, automatic alignment, ctags support
Plug 'sophacles/vim-bundle-mako' " Mako syntax support
Plug 'spf13/PIV' " PHP integration for Vim. Updated syntax support, better folding, better completion, php documentation generator.
Plug 'tmux-plugins/vim-tmux' " tmux.conf syntax file for vim.
Plug 'tpope/vim-git' " Adds syntax, indent, and filetype plugin files for git, gitcommit, gitconfig, gitrebase, and gitsendemail.
Plug 'tpope/vim-haml' " Adds syntax support for Haml, Sass and SCSS.
Plug 'vim-ruby/vim-ruby' " Adds enhanced Ruby syntax for Vim.
Plug 'vim-scripts/autohotkey-ahk' " Autohotkey syntax support for Vim.
Plug 'vim-scripts/jQuery' " Adds syntax support for JQuery.
Plug 'wting/cheetah.vim' " Cheetah templating syntax support.
" }}}
" {{{ Git plugins
Plug 'airblade/vim-gitgutter' " adds a +-~ to the gutter where things have been changed from what git is aware.
Plug 'gregsexton/gitv' " Extension to fugitive to see the git branching history.
Plug 'int3/vim-extradite' " Extension to fugitive that adds a git commit browser.
Plug 'junegunn/gv.vim' " A git log viewer.
Plug 'mattn/gist-vim' " Adds :Gist command for creating a Github gist from the current buffer or selected text.
Plug 'tpope/vim-fugitive' " Adds git integration to Vim. Many commands are added but :Gwrite is mapped to F1 and :Gcommit is mapped to F2.
" }}}
" {{{ File / directory navigation plugins
Plug 'FelikZ/ctrlp-py-matcher' " speeds up ctrlp by using a Python backend
Plug 'justinmk/vim-dirvish'    " Fast file / directory explorer plugin for Vim.
Plug 'kien/ctrlp.vim'          " Vim fuzzy buffer / file finder.
Plug 'Yggdroot/LeaderF'        " File fuzzy finder (alternative to CTRLP).
" }}}
" {{{ Buffer navigation plugins
Plug 'Lokaltog/vim-easymotion' " Adds extra motions
" }}}
" {{{ Snippet and completion plugins
Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neocomplete.vim'                        " Good autocompletion plugin. - Disabled as deoplete is it's replacement
Plug 'SirVer/ultisnips'                              " python based snippet engine.
Plug 'honza/vim-snippets'                            " Snippets for various programming languages in Ultisnips and snipmate format.
Plug 'hposca/ultisnips-terraform-snippets'           " terraform snippets for ultisnips.
Plug 'juliosueiras/vim-terraform-completion'         " Auto completion for terraform.
Plug 'matthewsimo/angular-vim-snippets'              " Adds AngularJS vim snippets.
Plug 'myhere/vim-nodejs-complete'                    " Nodejs omnicompletion support.
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/snipmate-snippets'                  " A collection of Snipmate snippets.
" }}}
" {{{ Vim colour themes and appearance plugins
Plug 'Yggdroot/indentLine'                           " adds indentation lines showing the different indentation levels.
Plug 'gorodinskiy/vim-coloresque'                    " highlights colour descriptions in CSS files with the colour they will create.
Plug 'jnurmine/Zenburn'                              " Adds the Zenburn theme.
Plug 'lifepillar/vim-solarized8'                     " Adds a 256 colour versions of the Solarized light and dark
Plug 'vim-airline/vim-airline'                       " Adds a pretty and useful Vim status line.
Plug 'vim-airline/vim-airline-themes'                " Themes for Vim Airline.
Plug 'zhaocai/GoldenView.Vim'                        " Resizes Vim splits based on the golden ratio to ensure that you are able to see what you are editing.
" }}}
" {{{ External tool integration
Plug 'jplaut/vim-arduino-ino'                        " Adds support for the Arduino Ino commandline interface for programming Arduinos.
Plug 'markcornick/vim-vagrant'                       " Adds :Vagrant command for interacting with Vagrant from within Vim.
Plug 'mileszs/ack.vim'                               " Adds the :Ack command which allows you to 'grep' for files very quickly using 'silversearcher' or 'ripgrep'
Plug 'tmux-plugins/vim-tmux-focus-events'            " Focus gained and focus lost (used by plugins) do not work in Tmux, this fixes that.
Plug 'tpope/vim-eunuch'                              " Adds support for many unix commands into Vim (too many commands added to list here).
Plug 'tpope/vim-tbone'                               " Adds tmux support to Vim (:Tmux for running any tmux command, :Tyank for yanking to Tmux's clipboard, :Tput for pasting from Tmux's clipboard and more).
" }}}
" {{{ Text / code editing
" Plug 'vim-syntastic/syntastic'                       " Syntax checking (alternative to ale but required for Terraform plugins).
Plug 'bronson/vim-trailing-whitespace'               " Highlights trailing whitespace in red, adds :FixWhitespace command to strip.
Plug 'claco/jasmine.vim'                             " Runs Javascript Jasmine tests.
Plug 'godlygeek/tabular'                             " Plugin for aligning text.
Plug 'jiangmiao/auto-pairs'                          " Automatically creates paired brackets and quotes. Has a toggle shortcut <Alt-p>.
Plug 'lukaszb/vim-web-indent'                        " Auto indentation support for Javascript and HTML.
Plug 'mattn/emmet-vim'                               " Allows you to write abbreviated HTML and then when a trigger key combo is pressed expand to full length html (key combo is C-y).
Plug 'tommcdo/vim-exchange'                          " Easy text exchange operator for vim use cx{motion} to initiate exchange. Go to what you want to exchange and do the same and they will be swapped.
Plug 'tpope/vim-commentary'                          " Commenting plugin, use gcc to comment out a line. gc and then a motion to comment out that area.
Plug 'tpope/vim-cucumber'                            " Adds support for the Cucumber Ruby acceptance testing framework to Vim.
Plug 'tpope/vim-scriptease'                          " A Vim plugin to help with creating Vim Plugins.
Plug 'vim-scripts/Align'                             " Adds an Align command for aligning based on a character for example select text you want to align and then run ( :'<,'>Align = ) to align the lines by their '=' sign. See :help align.
Plug 'vim-scripts/DrawIt'                            " Drawit allows you to draw ascii art using Vim. Useful for making textual diagrams. See :help drawit.
Plug 'vim-scripts/VOoM'                              " Vim Outliner of Markups. Allows you to create outlines of code and markup files.
Plug 'vimwiki/vimwiki'                               " Adds Vim wiki for taking notes (use <Space>ww to open) see :help vimwiki.
Plug 'w0rp/ale'                                      " Asyncronous linting engine (does linting and sytnax checking of source code while you edit it).
" }}}
" {{{ Vim functionality improvements
Plug 'haya14busa/incsearch.vim'                      " Improves incremental searching in Vim.
Plug 'jbnicolai/vim-AnsiEsc'                         " Adds :AnsiEsc command for converting Ansi colour codes to Vim colour codes.
Plug 'kshenoy/vim-signature'                         " Enhanced vim mark support (adds gutter icons for marks and extra mappings).
Plug 'majutsushi/tagbar'                             " Adds a tagbar for exhuberant ctags command is :TagbarToggle (mapped to F8 key).
Plug 'mbbill/undotree'                               " Adds :UndotreeToggle command to enable you to visualise your undo history and the changes you have made to the file (mapped to F5).
Plug 'mhinz/vim-startify'                            " Adds Startify which is a nice startup screen for Vim with the most recently opened files.
Plug 'mtth/scratch.vim'                              " Adds the gs command to normal mode to open a scratch buffer (for making quick notes).
Plug 'terryma/vim-expand-region'                     " Allows you to select more text in visual mode by repeatedly pressing 'v'.
Plug 'tpope/vim-obsession'                           " Automatic vim session saving plugin.
Plug 'tpope/vim-repeat'                              " Adds repeat ('.') support to various plugins.
Plug 'tpope/vim-sensible'                            " Vim sensible defaults (allows you to delete a huge amount of stuff from your Vimrc).
Plug 'tpope/vim-speeddating'                         " Improves the CTRL-A and CTRL-X increment and decrement shortcuts to work with dates.
Plug 'tpope/vim-surround'                            " Adds mappings to work with surrounding quotes / tags / parenthesis / more.
Plug 'tpope/vim-unimpaired'                          " Adds various mappings for, moving between files, buffers and toggling Vim options on and off (see :help unimpaired ).
" }}}

if has('win32') || has('win64')
  Plug 'powerline/fonts', { 'do': './install.ps1' }
else
  Plug 'powerline/fonts', { 'do': './install.sh' }
endif
call plug#end()

if !vimPlugNOTInstalled
  PlugUpdate
endif

" " }}}
" Plugin Config " {{{
" {{{ ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"}}}
" {{{ ale linters
let g:ale_linters = { 'gitcommit': ['proselint'], 'python': [ 'flake8' ], 'javascript': ['eslint'], 'jsx': ['eslint'] }
" let g:ale_linter_aliases = {'jsx': 'css'}
" }}}
" {{{ CTRLP
if !has('python')
  echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable('rg')
  set grepprg=rg\ --color=never
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
" }}}
" {{{ Deoplete
let g:deoplete#enable_at_startup = 1
" }}}
" {{{ dbeniamine/todo.txt-vim
" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete
" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>
" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>
" }}}
" {{{ elzr/vim-json
set conceallevel=0
let g:vim_json_syntax_conceal = 0 " stop vim hding quotes in json files.
" }}}
" {{{ Goldenview
let g:goldenview__enable_default_mapping=0
" }}}
" {{{ Gundo
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" }}}
" {{{ Large file editing
let g:LargeFile=1
" }}}
" {{{ Neocomplete
let g:acp_enableAtStartup = 0           " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase.
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.

let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
" {{{ Pencil
" let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd,vimwiki call pencil#init()
"   autocmd FileType text                 call pencil#init({'wrap': 'hard'})
" augroup END
" }}}
" {{{ Pymode
let g:pymode_lint_config = '$HOME/.pylint.rc'
let g:pymode_options_max_line_length=100
let g:pymode_rope=0
" }}}
" {{{ Quicktask
let g:quicktask_autosave = 1
let g:quicktask_snip_path = "~/quicktask-snips"
let g:quicktask_task_added_include_time = 1
" }}}
" {{{ Rainbow
let g:rainbow_active = 1
" }}}
" {{{ scratch
let g:scratch_persistence_file=expand("~/.vim/scratchfile")
" }}}
" {{{ Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_terraform_tffilter_plan = 1
" }}}
" {{{ Tagbar
nmap <F8> :TagbarToggle<CR>
" }}}
" {{{ Terraform
" Make commentary use the correct comment style in terraform files.
autocmd FileType terraform setlocal commentstring=#%s
" }}}
" {{{ Terraform completion
" (Optional)Remove Info(Preview) window
" set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" }}}
" {{{ Ultisnips
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="~/.vim/my-snippets"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "./plugged/aws-vim/snips", "my-custom-snippets"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" }}}
" {{{ Undotree
nnoremap <F5> :UndotreeToggle<CR>
" }}}
" {{{ vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
" }}}
filetype plugin indent on
"}}}
" General "{{{
set autowrite  " Writes on make/shell commands
set lazyredraw  " redraw only when we need to.
set nocompatible  " disable vi compatibility.
set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
set path+=**
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags
set timeoutlen=600  " Time to wait after ESC (default causes an annoying delay)
" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions
" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
" Buffers
set hidden      " The current buffer can be put to the background without writing to disk
" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
" Don't automatically add newlines to end of file:
set nofixeol
set noeol
" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" Completion
set omnifunc=syntaxcomplete#Complete
" "}}}
" Formatting "{{{
set fo-=o " Do not automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0     " Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set tabstop=2    " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)

" set cindent
" set cinoptions=:s,ps,ts,cs
" set cinwords=if,else,while,do,for,switch,case

filetype indent plugin indent on             " Automatically detect file types.
" HTML Formatting
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody,div,table,tr,p"

" PHP Formatting
let g:PHP_outdentphpescape = 1
let g:PHP_removeCRwhenUnix = 1
let g:PHP_outdentSLComments = 1
let g:PHP_default_indenting = 1
let g:PHP_vintage_case_default_indent = 1
" "}}}
" Command and Auto commands " {{{
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!

"Auto commands
" au BufRead,BufNewFile {*.php}                                         UltiSnipsAddFiletypes php
au BufRead,BufNewFile *.quicktask                                     setf quicktask
au BufRead,BufNewFile *.ino                                           setlocal filetype=arduino
au BufRead,BufNewFile *.pde                                           setlocal filetype=arduino
au BufRead,BufNewFile {*.html}                                        setlocal ft=html
au BufRead,BufNewFile {*.jade}                                        setlocal ft=jade
au BufRead,BufNewFile {*.less}                                        setlocal ft=less
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         setlocal complete=.,w,b,u,t,kspell
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         setlocal ft=markdown
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         setlocal spell
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         setlocal wrap
au BufRead,BufNewFile {*.php}                                         setlocal ft=php
au BufRead,BufNewFile {*.taskpaper}                                   setlocal ft=taskpaper
au BufRead,BufNewFile {*.tex}                                         nnoremap <F2> :!make<CR>
au BufRead,BufNewFile {*.tick}                                        :AnsiEsc
au BufRead,BufNewFile {COMMIT_EDITMSG}                                setlocal complete=.,w,b,u,t,kspell
au BufRead,BufNewFile {COMMIT_EDITMSG}                                setlocal ft=gitcommit
au BufRead,BufNewFile {COMMIT_EDITMSG}                                setlocal spell
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     setlocal ft=ruby
au BufRead,BufNewFile */cloudformation/*.json                         setlocal filetype=aws.json
au BufRead,BufNewFile *.scss                                          setlocal tabstop=4 shiftwidth=4 softtabstop=4
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file
au FileType quicktask setlocal nocindent
au FileType puppet setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType json setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
" " }}}
" Key mappings " {{{
let mapleader = "\<Space>"
let maplocalleader = ","
if has('win32') || has('win64')
  let directory=.,$TEMP " Swap file support for windows.
  let vimrcpath = $HOME . "/_vimrc"
  nnoremap <silent> <LocalLeader>vs :source $HOME/_vimrc<CR>
  nnoremap <silent> <LocalLeader>vt :tabnew $HOME/_vimrc<CR>
  nnoremap <silent> <LocalLeader>ve :e $HOME/_vimrc<CR>
  nnoremap <silent> <LocalLeader>vd :e $HOME/.vim/ <CR>
  nnoremap <silent> <LocalLeader>vc :vsplit $HOME/.vim/cheatsheet.md<CR>
  " nnoremap <silent> <LocalLeader>tn :e ~/Dropbox/TaskPaper/Todo.taskpaper<CR>
  " nnoremap <silent> <LocalLeader>ts :e ~/Dropbox/TaskPaper/TodoSomeday.taskpaper<CR>
else
  let vimrcpath = $HOME . "/git/dotfiles/vim/vimrc"
  nnoremap <silent> <LocalLeader>vs :source ~/git/dotfiles/vim/vimrc<CR>
  nnoremap <silent> <LocalLeader>vt :tabnew ~/git/dotfiles/vim/vimrc<CR>
  nnoremap <silent> <LocalLeader>ve :e ~/git/dotfiles/vim/vimrc<CR>
  nnoremap <silent> <LocalLeader>vc :vsplit ~/git/dotfiles/vim/cheatsheet.md<CR>
  nnoremap <silent> <LocalLeader>vd :e ~/.vim/ <CR>
  nnoremap <silent> <LocalLeader>tN :e ~/Dropbox/todo/todo.txt<CR>
  nnoremap <silent> <LocalLeader>tn :e ~/Dropbox/quicktask/tasks.quicktask<CR>
  nnoremap <silent> <LocalLeader>tp :e ~/Dropbox/quicktask/tasks-personal.quicktask<CR>
  " nnoremap <silent> <LocalLeader>ts :e ~/Dropbox/TaskPaper/TodoSomeday.taskpaper<CR>
endif

nnoremap <silent> <LocalLeader><Space> :noh<CR>

" Buffer maps
"" Close buffer without closing split
nmap <silent> <LocalLeader>d :bp\|bd #<CR>
"" Next buffer
nmap <silent> <LocalLeader>n :bn<CR>
"" Previous buffer
nmap <silent> <LocalLeader>n :bp<CR>

" Split line(opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew

" Add a new line at the end of the line.
map <S-CR> A<CR><ESC>

imap <C-Space> <C-X><C-O>

" Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR>

map <F1> :Gwrite<CR>
map <F2> :Gcommit<CR>
map <F3> :Git push<CR>
imap <F1> <ESC>:Gwrite<CR>i
imap <F2> <ESC>:Gcommit<CR>
imap <F3> <ESC>:Git push<CR>i

" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR>

" Expand region mappings for terryma/vim-expand-region plugin.
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Jump around using enter and backspace instead of g
" nnoremap <CR> G
" nnoremap <BS> gg
nmap <silent> <Leader>s :Startify<CR>
" " }}}
" Visual "{{{
set number  " Line numbers on
set relativenumber " and relative numbering too!
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set vb t_vb= " disable any beeps or flashes on error
set shortmess=atI " Shortens messages
set cursorline

set nolist " Display unprintable characters f12 - switches

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldlevel=0 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set mouse=a   " Enable mouse
set mousehide  " Hide mouse after chars typed

set splitbelow
set splitright

" "}}}
" Gui and theme options"{{{
if has('gui_running')
  set background=dark
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
else
  set background=dark
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://sunaku.github.io/vim-256color-bce.html
  set t_ut=
endif

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
colorscheme solarized8_dark_high

" cursor will change color depending on vim mode in use
let &t_SI = "\<Esc>]12;yellow\x7"
let &t_SR = "\<Esc>]12;red\x7"
let &t_EI = "\<Esc>]12;green\x7"
"}}}
" GUI Fonts " {{{
if has("gui_running")
  if has("gui_gtk2")
    " set guifont=Inconsolata\ 12
    set guifont=Terminal:h14:cOEM
  elseif has("gui_win32")
    " set guifont=Consolas:h11:cANSI
    " set guifont=Liberation_Mono_for_Powerline:h10
    set guifont=Terminal:h14:cOEM
  endif
endif
" }}}