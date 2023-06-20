local status, luasnip = pcall(require, "luasnip")
if (not status) then return end

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

require("luasnip").config.setup({ store_selection_keys = "<Tab>" })

-- basic config
local types = require("luasnip.util.types")
luasnip.config.set_config({
    history = true,                            --keep around last snippet local to jump back
    updateevents = "TextChanged,TextChangedI", --update changes as you type
    enable_autosnippets = true,
    ext_opts = {
            [types.choiceNode] = {
            active = {
                virt_text = { { "●", "GruvboxOrange" } },
            },
        },
    },
})

-- key mappings...
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap.set("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap.set("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap.set("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
