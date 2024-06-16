local autocmd = vim.api.nvim_create_autocmd

-- On entering a buffer go to last known cursor position
autocmd("BufWinEnter", {
  pattern = { "*" },
  command = 'silent! normal! g`"zv',
})

-- Remove whitespace before saving file
autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Invoke dune on 'ocaml' filetypes
autocmd("Filetype", {
  pattern = { "ocaml", "dune" },
  command = [[ setlocal makeprg=dune\ build\ @all ]]
})
