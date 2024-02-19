local status, floaterm = pcall(require, "telescope")
if (not status) then return end

vim.keymap.set('n', '<leader>tt', ':FloatermNew<cr>')
vim.keymap.set('n', '<leader>tg', ':FloatermToggle<cr>')
vim.keymap.set('n', '<leader>tp', ':FloatermPrev<cr>')
vim.keymap.set('n', '<leader>tn', ':FloatermNext<cr>')
vim.keymap.set('n', '<leader>tk', ':FloatermKill<cr>')
