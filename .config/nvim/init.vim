" NeoVim Config

" let
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean-community'
" autocmd
autocmd vimenter * ++nested colorscheme material
" syntax
syntax enable
" set
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set hidden
set number
set cmdheight=2
set smartindent
set autoindent
set splitbelow
set splitright
set conceallevel=0
set nowrap
set termguicolors
set cursorline
set noshowmode
set iskeyword+=-
set ruler
set background=dark
set updatetime=300
set signcolumn=number
set showtabline=2
set tabstop=4
set laststatus=0
set pumheight=10
set shiftwidth=2
set nobackup
set nowritebackup

" Plugins
call plug#begin('~/.config/nvim/plugged')
	" Terminal
	Plug 'lenovsky/nuake'
	" Airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Sensible
	Plug 'tpope/vim-sensible'
	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'
	" Auto Pairs for '[' '(' '{'
	Plug 'jiangmiao/auto-pairs'
	" LSP
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" GitGutter
	Plug 'airblade/vim-gitgutter'
	" Themes
	Plug 'kaicataldo/material.vim', { 'branch': 'main' }
call plug#end()

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Sensible
set scrolloff=6
set sidescrolloff=6

" Nuake
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n> :Nuake<CR>
tnoremap <F4> <C-\><C-n> :Nuake<CR>

" Buffer
nnoremap <silent> <C-Right> :bnext<CR>
nnoremap <silent> <C-Left> :bprevious<CR>
nnoremap <silent> <C-Q> :bdelete<CR>

" netrw
let g:netrw_liststyle = 3
let g:netrw_winsize = -28
let g:netrw_banner = 0
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Toggle netrw with Ctrl-O
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()

        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile

            close
        endif

        unlet t:expl_buf_num
    else
         Vexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction

map <silent> <C-O> :call ToggleVExplorer()<CR>
