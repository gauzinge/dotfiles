return {
    --Tmux stuff
    {
        --tmux stuff
        "christoomey/vim-tmux-navigator",
        "tmux-plugins/vim-tmux",
        "roxma/vim-tmux-clipboard",
    },
    {
        "scrooloose/nerdcommenter",
        enabled = false,
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "octol/vim-cpp-enhanced-highlight",
    },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require("neoscroll").setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,             -- Function to run after the scrolling animation ends
            })
        end,
    },
    {
        "terryma/vim-multiple-cursors",
    },
    {
        "smoka7/hop.nvim",
        version = "*",
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            options = {
                -- stylua: ignore
                close_command = function(n) require("mini.bufremove").delete(n, false) end,
                -- stylua: ignore
                right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                color_icons = true,
                show_tab_indicators = true,
                separator_style = "slant",
                diagnostics_indicator = function(_, _, diag)
                    local icons = require("lazyvim.config").icons.diagnostics
                    local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                        .. (diag.warning and icons.Warn .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        },
    },

    --  {
    --    --"jose-elias-alvarez/null-ls.nvim",
    --    "nvimtools/none-ls.nvim",
    --    opts = function(_, opts)
    --      --local nls = require("none-ls")
    --      local nls = require("null-ls")
    --      table.insert(opts.sources, nls.builtins.formatting.black)
    --    end,
    --  },
    --
    --  {
    --    "neovim/nvim-lspconfig",
    --    opts = {
    --      servers = {
    --        ruff_lsp = {},
    --        pyright = {
    --          settings = {
    --            python = {
    --              analysis = {
    --                autoImportCompletions = true,
    --                typeCheckingMode = "off",
    --                autoSearchPaths = true,
    --                useLibraryCodeForTypes = true,
    --                diagnosticMode = "workspace", -- "openFilesOnly",
    --              },
    --            },
    --          },
    --        },
    --      },
    --      setup = {
    --        --         pyright = function(_, _)
    --        --local lsp_utils = require("base.lsp.utils")
    --        --lsp_utils.on_attach(function(client, bufnr)
    --        --           local map = function(mode, lhs, rhs, desc)
    --        --             if desc then
    --        --               desc = desc
    --        --             end
    --        --             vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    --        --           end
    --        --             -- stylua: ignore
    --        --             if client.name == "pyright" then
    --        --               map("n", "<leader>lo", "<cmd>PyrightOrganizeImports<cr>",  "Organize Imports" )
    --        --               map("n", "<leader>lC", function() require("dap-python").test_class() end,  "Debug Class" )
    --        --               map("n", "<leader>lM", function() require("dap-python").test_method() end,  "Debug Method" )
    --        --               map("v", "<leader>lE", function() require("dap-python").debug_selection() end, "Debug Selection" )
    --        --             end
    --        --         end)
    --        --       end,
    --      },
    --    },
    --  },
    --
    --  {
    --    "mfussenegger/nvim-dap",
    --    dependencies = {
    --      "mfussenegger/nvim-dap-python",
    --      config = function()
    --        require("dap-python").setup() -- Use default python
    --      end,
    --    },
    --  },

    {
        "echasnovski/mini.surround",
    },
}
