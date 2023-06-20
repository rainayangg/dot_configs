--local status, ts = pcall(require, "vimtex")
--if (not status) then return end

vim.g.vimtex_quickfix_open_on_warning = 0 -- disable quickfix panel if there is no error
vim.g.vimtex_view_method = 'skim'         -- set pdf viewer to skim
vim.g.vimtex_view_skim_activate = 1       -- make skim have focus after every successful compilation
vim.g.vimtex_view_skim_sync = 1           -- make skim perform forward search after compilation
vim.g.vimtex_view_skim_reading_bar = 1    -- highlight current line
