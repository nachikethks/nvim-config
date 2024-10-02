return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")
        local aerial = require("aerial")

        lualine.setup({
            options = {
                theme = "auto",
                component_separators = "|",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {
                    { "mode", separator = { left = "" }, right_padding = 2 },
                },
                lualine_b = { "filename", "diff", "branch" },
                lualine_c = {
                    { "searchcount", icon = " " },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",

                        -- Table of diagnostic sources, available sources are:
                        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                        -- or a function that returns a table as such:
                        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                        sources = { "nvim_diagnostic" },

                        -- Displays diagnostics for the defined severity types
                        sections = { "error", "warn", "info", "hint" },

                        diagnostics_color = {
                            -- Same values as the general color option can be used here.
                            error = "DiagnosticError", -- Changes diagnostics' error color.
                            warn = "DiagnosticWarn",   -- Changes diagnostics' warn color.
                            info = "DiagnosticInfo",   -- Changes diagnostics' info color.
                            hint = "DiagnosticHint",   -- Changes diagnostics' hint color.
                        },
                        symbols = { error = '✘', warn = '▲', hint = '⚑', info = '»' },
                        colored = true,           -- Displays diagnostics status in color if set to true.
                        update_in_insert = false, -- Update diagnostics in insert mode.
                        always_visible = false,   -- Show diagnostics even if there are none.
                    },
                },
                lualine_y = { "encoding", "filetype" },
                lualine_z = {
                    { "progress" },
                    { "location", separator = { right = "" }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "progress", "location" },
            },
            tabline = {},
            winbar = {
                -- lualine_a = {
                --     {
                --         function()
                --             local breadcrumbs = aerial.get_location()
                --             local current_file = vim.api.nvim_buf_get_name(0)
                --             local project_root = vim.fn.getcwd()
                --             -- Escape special characters in the project_root to prevent pattern issues
                --             local escaped_project_root = project_root:gsub("([%.%+%-%*%?%[%]%^%$%(%)%%])", "%%%1") .. "/"
                --
                --             -- Substitute the project_root part from current_file to get the relative path
                --             local relative_path = current_file:gsub(escaped_project_root, "")
                --             print(vim.inspect(breadcrumbs))
                --
                --             for i, item in ipairs(breadcrumbs) do
                --                 relative_path = relative_path .. " " .. item.icon .. " " .. item.name
                --
                --                 if i < #breadcrumbs then
                --                     relative_path = relative_path .. " > "
                --                 end
                --             end
                --             return relative_path
                --         end
                --     },
                -- }
            },
            extensions = {},
        })
    end,
}
