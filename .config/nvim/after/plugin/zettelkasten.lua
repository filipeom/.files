require('zettelkasten').setup({
  home = '~/resources/notes'
})

vim.keymap.set('n', '<leader>zo', vim.cmd.ZkHome)
vim.keymap.set('n', '<leader>zn', vim.cmd.ZkNewNote)
