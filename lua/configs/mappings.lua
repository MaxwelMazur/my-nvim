-- Sair com 'q' , se usar gravação de macros altere para <C-q> → Ctrl + q
vim.cmd([[ map q :q<CR> ]])

-- Para Salvar com 'Ctrl + S' nos modos: Normal, Inserção e Visual
-- Precisa adicionar a linha: stty -ixon , ao seu ~/.bashrc
vim.cmd([[ map <C-s> :w<CR> ]])
vim.cmd([[ map <C-s> <Esc>:w<CR>l ]]) 
vim.cmd([[ map <C-s> <Esc>:w<CR> ]])
-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- Se não existir o arquivo C++ de extensão .cpp ele preenche da forma abaixo
-- altere para sua(s) linguagens preferidas
vim.cmd([[
	function! AutoCpp()
	  call append(0, '#include <iostream>')
	  call append(1, '')
	  call append(2, 'int main( int argc , char **argv ){')
	  call append(3, "  std::cout << \"Olá, Mundo!\" << '\\n';")
	  call append(4, '  return 0;')
	  call append(5, '}')
	  call cursor(4, 17)
	endfunction
	autocmd BufNewFile *.cpp :call AutoCpp()
]])

vim.cmd([[ nnoremap <C-n> :Ntree<CR> ]])
vim.cmd([[ nnoremap <C-p> :Telescope find_files<CR> ]])
vim.cmd([[ nnoremap <C-f> :Telescope live_grep<CR> ]])
vim.cmd([[ nnoremap <C-d> :t.<CR> ]])

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ':BufferMoveNext<CR>', opts)
-- Goto buffer in position...
-- Close buffer
map('n', '<A-q>', ':BufferClose<CR>', opts)
map('n', '<A-4>', ':GoTestFunc<CR>', opts)
map('n', '<A-5>', ':GoRun<CR>', opts)
map('n', '<A-2>', ':GoDebugBreakpoint<CR>', opts)
map('n', '<A-j>', ':GoDebugStart<CR>', opts)
map('n', '<A-l>', ':GoDebugContinue<CR>', opts)
map('n', '<C-l>', ':GoDebugNext<CR>', opts)
map('n', '<C-j>', ':GoDebugStep<CR>', opts)
map('n', '<C-h>', ':GoDebugStop<CR>', opts)
