require("conform").setup(
    {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            -- python = { "black" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            -- Conform will run the first available formatter
            javascript = { "prettierd", stop_after_first = true },
            latex = { "tex-fmt", "latexindent" },
            html = { "prettierd" },
            css = { "prettierd" },
        },
        notify_on_error = false,
        format_on_save = function(bufnr)
            -- Disable "format_on_save lsp_fallback" for languages that don't
            -- have a well standardized coding style. You can add additional
            -- languages here or re-enable it for the disabled ones.
            local disable_filetypes = { c = true, cpp = true }
            if disable_filetypes[vim.bo[bufnr].filetype] then
                return nil
            else
                return {
                    timeout_ms = nil,
                    lsp_format = "fallback",
                }
            end
        end,
    }
)
