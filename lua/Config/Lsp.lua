-- ── LSP Attach (keymaps, highlights, inlay hints) ────────────────────
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        local buf = event.buf
        -- Mapping helper: supports single mode or list of modes
        local map = function(keys, func, desc, modes)
            vim.keymap.set(modes or "n", keys, func, {
                buffer = buf,
                desc = "LSP: " .. desc,
            })
        end
        -- Cache telescope for faster repeated access
        local tb = require("telescope.builtin")
        map("H",  vim.lsp.buf.hover,                       "Hover Documentation")
        map("gn", vim.lsp.buf.rename,                      "Rename")
        map("ga", vim.lsp.buf.code_action,                 "Code Action", { "n", "x" })
        map("gr", tb.lsp_references,                       "Goto References")
        map("gm", tb.lsp_implementations,                  "Goto Implementation")
        map("gd", vim.lsp.buf.definition,                  "Goto Definition")
        map("gD", vim.lsp.buf.declaration,                 "Goto Declaration")
        map("gO", tb.lsp_document_symbols,                 "Open Document Symbols")
        map("gW", tb.lsp_dynamic_workspace_symbols,        "Open Workspace Symbols")
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- Document highlight
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local hi = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                group = hi, buffer = buf,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                group = hi, buffer = buf,
                callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = false }),
                callback = function(ev)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = hi, buffer = ev.buf })
                end,
            })
        end
        -- Inlay hints toggle
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map("<leader>th", function()
                local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
                vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
            end, "Toggle Inlay Hints")
        end
    end,
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd", "basedpyright", "texlab", "jdtls",
        "html", "htmx",
        -- …
    },
})

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
