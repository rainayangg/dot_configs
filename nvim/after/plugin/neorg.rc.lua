local status, neorg = pcall(require, "neorg")

neorg.setup {
    load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {
            config = {
                icons = {
                    code_block = {
                        conceal = true
                    }
                }
            }

        }, -- Adds pretty icons to your documents
            ["core.completion"] = {
            config = {
                engine = 'nvim-cmp'
            }
        },
            ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    home = "~/neorg",
                },
            },
        },
    },
}

vim.cmd [[set conceallevel=3]]
