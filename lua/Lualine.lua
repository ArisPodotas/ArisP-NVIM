require('lualine').setup(
    {
        opts = {
            options = {
                icons_enabled = true,
                theme = 'onedark',
                -- component_separators = { left = '', right = '' },
                -- component_separators = { left = '|', right = '|' },
                component_separators = { left = '/', right = '/' },
                -- component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' '}, sources = { "nvim_diagnostic" } } },
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress', function() return vim.fn.line('$') end},
                lualine_z = {'location', 'searchcount', --function() local handle = io.popen("wmic path Win32_Battery get EstimatedChargeRemaining")
                    --   if handle then
                    --     local result = handle:read("*a")
                    --     handle:close()
                    --     local batteryPercentage = tonumber(result:match("%d+"))
                    --     return tostring(batteryPercentage) .. " 󰁹"
                    --   else
                    --     print("batteryPercentage failed")
                    --   end
                    -- end,
                    -- function ()
                    --   local dateTimeString = os.date("%d-%m %H:%M")
                    --   return dateTimeString
                    -- end
                }
            },
        },
    }
)
