--Tabulation
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")


--Line number option
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.clipboard = "unnamedplus"

--Wrapping options
vim.o.linebreak = true
vim.o.breakindent = true

--Search options
vim.o.ignorecase = true
vim.o.smartcase = true

--Keep undo history working even after the file is opened
vim.o.undofile = true

--New splits config
vim.o.splitright = true
vim.o.splitbelow = true


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

