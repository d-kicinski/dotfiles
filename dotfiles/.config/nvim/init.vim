set packpath+=~/.vim
source ~/.vimrc

call plug#begin()
    " Navigation
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    " Use Ctrl + vi moving keys to switch between windows
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'

    " Coloring
    Plug 'joshdick/onedark.vim'
    Plug 'liuchengxu/space-vim-theme'
    Plug 'endel/vim-github-colorscheme'


    " Autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Markdown 
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

call plug#end()

map <Space> <Leader>

set background=dark
colorscheme space_vim_theme
set number

nnoremap <leader>ff :Files<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap f <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
