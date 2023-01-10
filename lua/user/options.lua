vim.opt.guicursor = ''
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 100
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 1
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' }
vim.opt.conceallevel = 0
vim.opt.fileencoding = 'utf-8'
vim.opt.ignorecase = true
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 500
vim.opt.writebackup = false
vim.opt.cursorline = true
vim.opt.numberwidth = 4
vim.opt.sidescrolloff = 8
vim.opt.guifont = 'FiraCode NFM'
vim.opt.whichwrap = 'bs<>[]hl'
vim.opt.shell = 'powershell'
vim.opt.shortmess:append 'c'
vim.opt.iskeyword:append '-'
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 50 })
  end,
  group = highlight_group,
  pattern = '*',
})

