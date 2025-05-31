-- g` is a redundant keybind so you can map it
vim.api.nvim_create_autocmd(
    "LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
            local map = function(keys, func, desc, mode)
                mode = mode or "n"
                vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
            end
            map("H", vim.lsp.buf.hover, "[H]over Documentation")
            map("gn", vim.lsp.buf.rename, "[R]e[n]ame")
            map("ga", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
            map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            map("gm", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
            map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
            map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
            map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
            map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
            -- map("g<C-t>", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
            -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
            ---@param client vim.lsp.Client
            ---@param method vim.lsp.protocol.Method
            ---@param bufnr? integer some lsp support methods only in specific files
            ---@return boolean
            local function client_supports_method(client, method, bufnr)
                if vim.fn.has("nvim-0.11") == 1 then
                    return client:supports_method(method, bufnr)
                else
                    return client.supports_method(method, { bufnr = bufnr })
                end
            end
            -- The following two autocommands are used to highlight references of the
            -- word under your cursor when your cursor rests there for a little while.
            --    See `:help CursorHold` for information about when this is executed
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if
                client
                and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
            then
                local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references,
                })
                vim.api.nvim_create_autocmd("LspDetach", {
                    group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                    callback = function(event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                    end,
                })
            end
            -- -- The following code creates a keymap to toggle inlay hints in your
            -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            -- 	map("<leader>th", function()
            -- 		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            -- 	end, "[T]oggle Inlay [H]ints")
            -- end
        end,
    }
)

require("mason").setup()

local servers = {
	clangd = {},
	-- matlab_ls = {},
	-- gopls = {},
	pyright = {
		python = {
			analysis = {
				diagnosticMode = "workspace",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
	-- perlnavigator = {},
	-- intelephense =  {},
	-- powershell_es = {},
	-- r_language_server = {},
	-- rust_analyzer = {},
	-- tsserver = {},
	html = { filetypes = { "html", "twig", "hbs" } },
	ts_ls = {},
	cssls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = true },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "love" },
			},
			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			-- diagnostics = { disable = { 'missing-fields' } },
		},
	},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(
    ensure_installed, {
        "stylua", -- Used to format Lua code
    }
)

mason_lspconfig.setup(
    {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
            function(server_name)
                local server = servers[server_name] or {}
                server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                require("lspconfig")[server_name].setup(server)
            end,
        },
    }
)

-- Set highlight for the hover window content
-- vim.api.nvim_set_hl(0, 'NormalFloat', { fg = '#ffffff', bg = '#2e2e2e' }) -- White text, dark gray background
-- Set highlight for the hover window border
-- vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#569cd6', bg = '#2e2e2e' }) -- Blue border, same background

