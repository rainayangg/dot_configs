vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
local util = require 'lspconfig.util'

if (not status) then return end

local protocol = require('vim.lsp.protocol')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


local on_attach = function(client, bufnr)
    -- formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Formatt]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup End]]
    end
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end



nvim_lsp.gopls.setup {
    cmd = { 'gopls' },
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "go", "gomod" },
    settings = {
        gopls = {
            completeUnimported = true, -- automatically import packages on use
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
}


nvim_lsp.pyright.setup {
    on_attach = on_attach,
}


nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}

--nvim_lsp.ccls.setup {
--on_attach = on_attach,
--init_options = {
--compilationDatabaseDirectory = "build",
--cache = {
--directory = "/tmp/ccls-cache"
--},
--index = {
--threads = 0,
--},
--clang = {
--excludeArgs = { "-frounding-math" },
--},
--}
--}

-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr)
    bufnr = util.validate_bufnr(bufnr)
    local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    if clangd_client then
        clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                print 'Corresponding file cannot be determined'
                return
            end
            vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
        end, bufnr)
    else
        print 'method textDocument/switchSourceHeader is not supported by any servers active on the current buffer'
    end
end

local root_pattern = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git',
}

nvim_lsp.clangd.setup {
    cmd = { 'clangd' },
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = function(fname)
        return util.root_pattern(unpack(root_pattern))(fname) or util.find_git_ancestor(fname)
    end,
    commands = {
        ClangdSwitchSourceHeader = {
            function()
                switch_source_header(0)
            end,
            description = 'Switch between source/header',
        },
    },
}
