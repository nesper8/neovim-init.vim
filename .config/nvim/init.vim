" nesper8's NeoVim Config

" autocmd
autocmd vimenter * ++nested colorscheme gruvbox
autocmd vimenter,BufNewFile,BufRead * set formatoptions-=cro

" set
set hidden
set number
set smartindent
set autoindent
set splitbelow
set splitright
set termguicolors
set cursorline
set noshowmode
set ruler
set nobackup
set nowritebackup
set noswapfile
set shortmess+=c
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set cmdheight=2
set conceallevel=0
set signcolumn=number
set iskeyword+=-
set updatetime=300
set showtabline=2
set tabstop=4
set laststatus=0
set pumheight=10
set shiftwidth=4
set completeopt=menuone
set guifont=FiraCode\ Nerd\ Mono:h15

" Others
syntax enable
filetype plugin on
setlocal wrap

" Plugins
call plug#begin('~/.config/nvim/plugged')
	" Terminal
	Plug 'lenovsky/nuake'
	" Airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    " Commentary
    Plug 'tpope/vim-commentary'
	" Sensible
	Plug 'tpope/vim-sensible'
	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'
	" LSP
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" GitGutter
	Plug 'airblade/vim-gitgutter'
	" Themes
	Plug 'morhetz/gruvbox'
call plug#end()

" Gruvbox
let g:gruvbox_bold = 1
let g:gruvbox_italic = 0
let g:gruvbox_transparant_bg = 1
let g:gruvbox_termcolors = 1
let g:gruvbox_invert_tabline = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Sensible
set scrolloff=6
set sidescrolloff=10

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
 
