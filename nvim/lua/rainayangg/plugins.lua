local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use 'nvim-lualine/lualine.nvim' -- Statusline
    use 'nvim-lua/plenary.nvim'     -- Common utilities
    use 'onsails/lspkind-nvim'      -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer'        -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp'      -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-omni'
    use 'neovim/nvim-lspconfig' -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
    }
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use "nvim-telescope/telescope-file-browser.nvim"
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use 'vimwiki/vimwiki'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'preservim/nerdcommenter'
    use 'lervag/vimtex'
    use 'nvim-tree/nvim-web-devicons'
    use 'voldikss/vim-floaterm'
    if packer_bootstrap then
        require('packer').sync()
    end
end)
