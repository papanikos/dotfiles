" Colors

let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

" Fancy status line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

" Conquer of Completion

" The path needs to be changed
let g:coc_node_path = '/usr/local/bin/node'

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

" Show help for function
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" YouCompleteMe

let g:ycm_autoclose_preview_window_after_completion = 1

" FZF - Fuzzy Finder
source ~/miniconda3/pkgs/fzf-0.27.2-ha8f183a_1/share/fzf/plugin/fzf.vim

