vim.keymap.set('n', '<leader>nn', vim.cmd.Ex)
-- vim.keymap.set('n', '<leader>w', ':w!<CR>')
-- vim.keymap.set('n', '<leader>q', ':q!<CR>')

-- ctrl-v
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+y')

-- nagivation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- dune
vim.keymap.set('n', '<leader>m', ':make<CR>')
