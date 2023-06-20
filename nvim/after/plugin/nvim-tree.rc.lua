local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
nvim_tree.setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    actions = {
        open_file = {
            resize_window = false,
        },
    },
    view = {
        number = true,
    },
})
