-- Silent keymap option
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Navigate buffers
vim.keymap.set("n", "gk", ":bnext<CR>", opts)
vim.keymap.set("n", "gj", ":bprevious<CR>", opts)

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Close buffers
vim.keymap.set("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)
vim.keymap.set("n", "<leader>C", "<cmd>bufdo :Bdelete!<CR>", opts)

-- Better paste
vim.keymap.set("v", "p", '"_dP', opts)

-- Insert --

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Plugins --

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", opts)
vim.keymap.set("n", "<leader>ft", ":lua require'telescope.builtin'.live_grep({ additional_args = function(opts) return {'--hidden'} end})<CR>", opts)
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Comment
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current(nil, {})<CR>", opts)
vim.keymap.set("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
vim.keymap.set("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
vim.keymap.set("n", "<leader>dk", "<cmd>lua require('dap.ui.widgets').hover()<cr>", opts)

-- MikaelElkiaer
vim.keymap.set("n", "<leader>fF", ":Telescope find_files hidden=true no_ignore=true<CR>", opts)
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>fG", ":lua require'telescope.builtin'.live_grep({ additional_args = function(opts) return {'--hidden', '--no-ignore'} end})<CR>", opts)
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles only_cwd=true<CR>", opts)
vim.keymap.set("n", "<leader>fO", ":Telescope oldfiles<CR>", opts)
vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", opts)
vim.keymap.set("n", "<leader>fS", ":Telescope lsp_workspace_symbols<CR>", opts)
vim.keymap.set("n", "<leader>fl", ":Telescope file_browser path=%:p:h initial_mode=normal hidden=true respect_gitignore=false<CR>", opts)
vim.keymap.set("n", "<leader>fL", ":Telescope file_browser initial_mode=normal hidden=true respect_gitignore=false<CR>", opts)
vim.keymap.set("n", "<leader>fp", ":Telescope reprosjession root_dir=" .. vim.loop.os_homedir() .. "/Repositories<CR>", opts)

-- TUIs
vim.keymap.set("n", "<leader><leader>g", "<cmd>lua require'toggleterm.terminal'.Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' }):toggle()<CR>", opts)
vim.keymap.set("n", "<leader><leader>d", "<cmd>lua require'toggleterm.terminal'.Terminal:new({ cmd = 'lazydocker', hidden = true, direction = 'float', dir='%:p:h' }):toggle()<CR>", opts)
vim.keymap.set("n", "<leader><leader><cr>", "<cmd>ToggleTerm<CR>", opts)

-- vim-test
vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<CR>", opts)
vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<CR>", opts)
vim.keymap.set("n", "<leader>ts", "<cmd>TestSuite<CR>", opts)
vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<CR>", opts)
vim.keymap.set("n", "<leader>tv", "<cmd>TestVisit<CR>-\\><C-n><C-w>l", opts)

-- Normal Mode Swapping:
-- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vU", function()
	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vD", function()
	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

-- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vd", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vu", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

--> If the mappings above don't work, use these instead (no dot repeatable)
-- vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
-- vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
-- vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
-- vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)

-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)

-- Select Nodes in Visual Mode
vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', opts)
vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', opts)
vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', opts)
vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', opts)

-- Swapping Nodes in Visual Mode
vim.keymap.set("x", "<A-j>", '<cmd>STSSwapNextVisual<cr>', opts)
vim.keymap.set("x", "<A-k>", '<cmd>STSSwapPrevVisual<cr>', opts)

-- rest-nvim
vim.keymap.set('n', '<leader>rh', '<cmd>lua require("rest-nvim").run()<cr>', opts)
vim.keymap.set('n', '<leader>rH', '<cmd>lua require("rest-nvim").run(true)<cr>', opts)

-- run code
vim.keymap.set('n', '<leader>rc', '<cmd>FlowRunFile<cr>', opts)
vim.keymap.set('v', '<leader>rc', '<cmd>FlowRunSelected<cr>', opts)
-- scratch for temporary code
vim.keymap.set("n", "<leader>sn", "<cmd>Scratch<cr>", opts)
vim.keymap.set("n", "<leader>sN", "<cmd>ScratchWithName<cr>", opts)
vim.keymap.set("n", "<leader>so", "<cmd>ScratchOpen<cr>", opts)
vim.keymap.set("n", "<leader>sO", "<cmd>ScratchOpenFzf<cr>", opts)

-- cellular-automation
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
