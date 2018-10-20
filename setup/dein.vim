" dein activation
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/bundle'))
" Let dein manage dein (required)
call dein#add('Shougo/dein.vim')

let g:dein#enable_notification=1

""""""""""""""""""""""
" Personal must have "
""""""""""""""""""""""

" git integration.
call dein#add('tpope/vim-fugitive')

" Interactive git log viewer.
call dein#add('kablamo/vim-git-log')
" Snippets.
call dein#add('SirVer/ultisnips')

" Default snippets for UltiSnips
call dein#add('honza/vim-snippets')

" Python-mode
call dein#add('klen/python-mode',
            \ {'on_ft': 'python'}
            \ )

call dein#add('vim-scripts/The-NERD-tree')

" Show a tip on vim startup.
call dein#add('hobbestigrou/vimtips-fortune')

call dein#add('whiledoing/cmakecomplete',
            \ {'on_ft': 'cmake'}
            \ )

" Editing ROS source files.
call dein#add('taketwo/vim-ros')

call dein#add('othree/xml.vim',
            \ )

call dein#add('ivanov/vim-ipython',
            \ {'on_ft': 'python'}
            \ )

" Manage parentheses and similar.
call dein#add('tpope/vim-surround')

" Pairs of handy bracket mappings.
call dein#add('tpope/vim-unimpaired')

" Automatic indent detection.
call dein#add('tpope/vim-sleuth')

" Block commenting.
call dein#add('tpope/vim-commentary')

" Set the `path` variable for more efficient jump to file (gf).
call dein#add('tpope/vim-apathy')

" Automatic LaTeX plugin.
" The original is http (i.e. not https) and not supported by dein.
" NeoBundle 'http://git.code.sf.net/p/atp-vim/code', {'name': 'atp-vim'}
call dein#add('coot/atp_vim',
            \ {'on_ft': ['tex', 'bib', 'bst', 'sty']}
            \ )

" Editor agnostic configuration.
call dein#add('editorconfig/editorconfig-vim')

" Powerline is installed with pip on Ubuntu, so don't install it here.
"call dein#add('Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'})

" A code-completion engine.
" On Ubuntu 14.04, it's also offered system-wide and activated with
" 'vim-addons install youcompleteme'.
" Lock to revision 'f928f7dd975d26b608d5310a9139dc5fc310e4a9' because newer
" commits require vim 7.4.143+, not available on Ubuntu 14.04.
if (v:version < 800)
            call dein#add('Valloric/YouCompleteMe',
                        \ {'build': 'python install.py --clang-completer --gocode-completer',
                        \  'timeout': 600,
                        \  'rev': 'f928f7dd975d26b608d5310a9139dc5fc310e4a9'
                        \ }
                        \ )
else
            call dein#add('Valloric/YouCompleteMe',
                        \ {'build': 'python install.py --clang-completer --gocode-completer',
                        \  'timeout': 600
                        \ }
                        \ )
endif

" Browse files, buffers, lines ... (:Unite).
call dein#add('Shougo/unite.vim')

" Most-recently-used support for Unite (:Unite file_mru)
call dein#add('Shougo/neomru.vim')

" Interactive command execution (for :Unite file_rec/async)
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" A class outline viewer
call dein#add('majutsushi/tagbar')

" extended % matching for HTML, LaTeX, and many other languages
call dein#add('tmhedberg/matchit')

" Lego Mindstorms (nxc) syntax.
call dein#add('vim-scripts/nxc.vim')

"""""""""""""""""
" Local plugins "
"""""""""""""""""

call dein#local('~/.vim/bundle/local/castem')
call dein#local('~/.vim/bundle/local/mbdyn')
call dein#local('~/.vim/bundle/local/orocos')

""""""""""""""""""""""""""""""""
" Not often used but practical "
""""""""""""""""""""""""""""""""

" Undo management (:GundoToggle).
call dein#add('sjl/gundo.vim')

" Syntax highlighting support for Pweave files, scientific report with
" LaTeX and Python.
call dein#add('naught101/vim-pweave')

" MoinMoin syntax highlighting.
call dein#add('vim-scripts/moin.vim.git')

" JSON bindings.
" aj provides a text object for the outermost JSON object, array, string, number, or keyword.
" gqaj "pretty prints" (wraps/indents/sorts keys/otherwise cleans up) the JSON construct under the cursor.
" gwaj takes the JSON object on the clipboard and extends it into the JSON object under the cursor.
call dein#add('tpope/vim-jdaddy')

"""""""""""""""""""""""""""""""""""""""""""
" Why not but short startup time prefered "
"""""""""""""""""""""""""""""""""""""""""""

"call dein#add('tmhedberg/SimpylFold')
"call dein#add('vim-scripts/taglist.vim')
"call dein#add('trotter/autojump.vim')

"call dein#add('vim-scripts/project.tar.gz')

" Syntax checking.
"call dein#add('scrooloose/syntastic')

" Show a VCS diff using Vim's sign column
"call dein#add('mhinz/vim-signify')

" Experimental minimap
"call dein#add('severin-lemaignan/vim-minimap')


"""""""""""""""""""""""""""""""""""""""""""""
" Functionalities provided by other plugins "
"""""""""""""""""""""""""""""""""""""""""""""

" minimal commenting plugin.
"call dein#add('vim-scripts/vim-addon-commenting')

" Most recently used (:MRU)
" Deactivated in favor of Unite.
"call dein#add('vim-scripts/mru.vim')

" Python completion (included in YouCompleteMe)
"call dein#add('davidhalter/jedi-vim.git')

" snipMate is incompatible with YouCompleteMe
" UltiSnips is used instead of snipMate because of compatibility with YCM
"call dein#add('msanders/snipmate.vim')

" Fast file navigation.
" Deactivated in favor of Unite (:Unite file).
"call dein#add('wincent/command-t')

" quickly and easily switch between buffers.
" Deactivated in favor of Unite (:Unite buffer).
"call dein#add('c9s/bufexplorer')

" buffer/file/command/tag/etc explorer with fuzzy matching
" Deactivated in favor of Unite.
"call dein#add('vim-scripts/FuzzyFinder')

""""""""""""""""""""""""""""""""""
" Useless or problematic plugins "
""""""""""""""""""""""""""""""""""

" provides some utility functions and commands for programming in Vim.
" Only a dependency.
"call dein#add('vim-scripts/L9')

" Project Management.
" Deactivated because not used and problem with end of lines.
"call dein#add('vim-scripts/ProjectBrowse', {rev: 'unix-eol'}

" cmake.vim changes makeprg in a way that is incompatible with vim-ros
"call dein#add('jalcine/cmake.vim')

" delimitMate was not really satisfying (didn't insert <CR> after '{',
" broke '.' for repeat last insert
" https://github.com/Raimondi/delimitMate/issues/138)
"call dein#add('Raimondi/delimitMate')

" Syntax and occurences highlighting
" requires Vim 7.4p330+
"call dein#add('bbchung/clighter.git')

" Automatic bracket insertion.
" Two dependencies of lh-brackets
" Not ideal because doesn't support redo, as of 2015-10.
"call dein#add('LucHermitte/lh-vim-lib')
"call dein#add('LucHermitte/lh-dev')
"call dein#add('LucHermitte/lh-brackets')

call dein#end()

