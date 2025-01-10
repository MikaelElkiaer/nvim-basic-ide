vim.filetype.add({
  extension = {
    bats = "bash",
    cheat = "cheat",
    csx = "csx",
    hsh = "hush",
    json = "jsonc",
    keymap = "devicetree",
    overlay = "devicetree",
  },
})
vim.g.autoformat = false
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.backup = false
vim.opt.completeopt = "menu,menuone,noinsert,noselect"
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.ignorecase = true
vim.opt.laststatus = 0 -- Hide default status bar
vim.opt.list = true
vim.opt.number = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = vim.g.vscode and 1000 or 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.virtualedit = "block"
vim.opt.wrap = true
vim.opt.writebackup = false
vim.treesitter.language.register("c_sharp", "csx")
vim.treesitter.language.register("bash", "cheat")
-- Improved diagnostics styling
vim.diagnostic.config({
  float = {
    border = "rounded",
  },
  virtual_text = false,
})
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
