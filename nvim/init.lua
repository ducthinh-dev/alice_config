local vim = vim
local Plug = vim.fn['plug#']

vim.cmd("source /home/alice/alice_config/.vimrc")

require('lspconfig').phpactor.setup{}


-- Start plug
vim.call('plug#begin')

-- List of plugins go here

vim.call('plug#end')
