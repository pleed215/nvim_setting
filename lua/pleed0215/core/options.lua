local opt = vim.opt -- for conciseness

-- vim options
opt.showcmd = true
opt.smarttab = true

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.autoindent = true
opt.ai = true -- auto indent
opt.si = true -- smart indent
opt.wrap = false -- no wrap lines

opt.path:append({ "**" }) -- Finding files - search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- Undercurl not working on iTerm2 right now.
vim.cmd([[let &t_Cs = "\e[4:3m]"]])
vim.cmd([[let &t_Ce = "\e[4:0m]"]])

-- cursor options
opt.cursorline = true
opt.pumblend = 5
