local keymap = vim.keymap

-- Config leader key
vim.g.mapleader = ' '

-- Fast saving
vim.keymap.set('n', '<leader>w', '<cmd>wall!<cr>')

-- Select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Copy to and paste from clipboard
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')

-- Disable highlight when <leader><cr> is pressed
vim.keymap.set('n', '<leader><cr>', ':noh<cr>', { silent = true })

-- Buffers related
vim.keymap.set('n', '<leader>ba', ':bufdo bd<cr>')
vim.keymap.set('n', '<leader>l', ':bnext<cr>')
vim.keymap.set('n', '<leader>h', ':bprevious<cr>')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Smart way to move between windows
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')

-- Map jj to <Esc>
vim.keymap.set("i", "jj", "<Esc>")

-- nvim-tree
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<cr>', { noremap = true })

-- Terminal mode
vim.keymap.set('t', 'jj', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('n', '<leader>t', ':terminal<cr>', { noremap = true })
