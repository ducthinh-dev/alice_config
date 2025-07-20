local vim = vim
local Plug = vim.fn['plug#']

vim.cmd("source /home/alice/alice_config/.vimrc")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Start plug
vim.call('plug#begin')

-- List of plugins go here
Plug('neovim/nvim-lspconfig')
Plug 'hrsh7th/nvim-cmp'          -- Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp'      -- LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'        -- Buffer completions
Plug 'hrsh7th/cmp-path'          -- Path completions
Plug 'hrsh7th/cmp-cmdline'       -- Command line completions
Plug 'L3MON4D3/LuaSnip'          -- Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'  -- Snippet completions
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'


vim.call('plug#end')


-- LSP
local lspconfig = require('lspconfig')

-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSP
    { name = 'luasnip' },  -- Snippets
  }, {
    { name = 'buffer' },   -- Current buffer
    { name = 'path' },     -- Filesystem paths
  })
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- nvim-tree
require("nvim-tree").setup()


-- LSP Config
require('lspconfig').phpactor.setup{
    capabilities = capabilities
}

require('lspconfig').pyright.setup{
    capabilities = capabilities
}

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
