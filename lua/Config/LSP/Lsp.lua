--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map("H", vim.lsp.buf.hover, "Hover Documentation")
        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("gn", vim.lsp.buf.rename, "Rename")
        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("ga", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
        map("gr", require("telescope.builtin").lsp_references, "Goto References")
        map("gm", require("telescope.builtin").lsp_implementations, "Goto Implementation")
        map("gd", vim.lsp.buf.definition, "Goto Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration") --  For example, in C this would take you to the header.
        map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
        map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method('textDocument/documentHighlight', event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
            })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client:supports_method('textDocument/inlayHint', event.buf) then
            map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle Inlay [H]ints')
        end
    end,
})

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--  See `:help lsp-config` for information about keys and how to configure
---@type table<string, vim.lsp.Config>
local servers = {
	clangd = {},
	-- gopls = {},
    basedpyright = {
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoImportCompletions = true,
                }
            },
        }
    },
	-- r_language_server = {},
	-- rust_analyzer = {},
    -- eslint = {},
    texlab = { filetypes = {'tex', 'plaintex'} },
	html = { filetypes = { "html", "twig", "hbs" } },
	cssls = {},
    -- biome = {},
    -- denols = {},
	ts_ls = { filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescritpreact'} },
    stylua = {}, -- Used to format Lua code
    -- Special Lua Config, as recommended by neovim help docs
    lua_ls = {
        on_init = function(client)
            client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
            end
            local current_settings = client.config.settings --[[@as lspconfig.settings.lua_ls]]
            client.config.settings.Lua = vim.tbl_deep_extend('force', current_settings.Lua, {
                runtime = {
                    version = 'LuaJIT',
                    path = { 'lua/?.lua', 'lua/?/init.lua' },
                },
                workspace = {
                    checkThirdParty = false,
                    -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
                    --  See https://github.com/neovim/nvim-lspconfig/issues/3189
                    library = vim.api.nvim_get_runtime_file('', true),
                },
            })
        end,
        ---@type lspconfig.settings.lua_ls
        settings = {
            Lua = {
                format = { enable = false }, -- Disable formatting (formatting is done by stylua)
            },
        },
    },
}

-- Automatically install LSPs and related tools to stdpath for Neovim
require('mason').setup {}

-- Translates between nvim-lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)
require('mason-lspconfig').setup {
    automatic_enable = false, -- Change this to true if you want to automatically enable servers that are installed manually (e.g. via :Mason / :MasonInstall)
}

-- Ensure the servers and tools above are installed
--
-- To check the current status of installed tools and/or manually install
-- other tools, you can run
--    :Mason
--
-- You can press `g?` for help in this menu.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
    -- You can add other tools here that you want Mason to install
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
end
