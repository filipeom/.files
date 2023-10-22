local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

autocmd("Filetype", {
  pattern = { "ocaml", "dune" },
  command = [[ setlocal makeprg=dune\ build\ @install ]]
})
