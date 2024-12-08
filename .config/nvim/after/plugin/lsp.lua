local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  -- lsp.default_keymaps(opts)
  vim.keymap.set('n', 'T', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<F3>', function() vim.lsp.buf.format() end, opts)
  vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
end)

lsp.setup_servers(
  { 'ts_ls'
  , 'eslint'
  , 'ocamllsp'
  , 'clangd'
  , 'marksman'
  , 'bashls'
  , 'pyright'
  , 'texlab'
  , 'lua_ls'
})
lsp.setup()
