-- ── LSP Attach (keymaps, highlights, inlay hints) ────────────────────
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("H",          vim.lsp.buf.hover,                                        "Hover Documentation")
        map("gn",         vim.lsp.buf.rename,                                       "Rename")
        map("ga",         vim.lsp.buf.code_action,                                  "Code Action", { "n", "x" })
        map("gr",         require("telescope.builtin").lsp_references,              "Goto References")
        map("gm",         require("telescope.builtin").lsp_implementations,         "Goto Implementation")
        map("gd",         vim.lsp.buf.definition,                                   "Goto Definition")
        map("gD",         vim.lsp.buf.declaration,                                  "Goto Declaration")
        map("gO",         require("telescope.builtin").lsp_document_symbols,        "Open Document Symbols")
        map("gW",         require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Document highlight on cursor hold
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local hi = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf, group = hi, callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf, group = hi, callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                end,
            })
        end

        -- Inlay hints toggle
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "Toggle Inlay Hints")
        end
    end,
})

-- ── Mason (just for installing servers, no handler magic) ─────────────
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd", "basedpyright", "texlab", "jdtls",
        "html", "htmx", "ts_ls", "cssls", "lua_ls",
    },
})

-- ── LSP server configs ────────────────────────────────────────────────
local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
    clangd       = {},
    basedpyright = {
        settings = {
            basedpyright = {
                analysis = { typeCheckingMode = "basic", autoImportCompletions = true },
            },
        },
    },
    texlab = { filetypes = { "tex", "plaintex" } },
    html   = { filetypes = { "html", "twig", "hbs" } },
    cssls  = {},
    ts_ls  = { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
    lua_ls = {
        settings = {
            Lua = {
                workspace  = { checkThirdParty = true },
                telemetry  = { enable = false },
                diagnostics = { globals = { "love" } },
            },
        },
    },
}

for server, config in pairs(servers) do
    config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end
