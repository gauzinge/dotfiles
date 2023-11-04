return {
    -- add colorschemes
    { "ellisonleao/gruvbox.nvim" },
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "storm",
            transparent = false,
            styles = {
                sidebars = "dark",
                floats = "dark",
            },
            dim_inactive = true, -- dims inactive windows
            lualine_bold = true,
        },
    },
    {
        "catppuccin/nvim",
        opts = {
            transparent_background = false,
        },
        lazy = false,
        name = "catppuccin",
        flavour = "mocha",
        dim_inactive = {
            enabled = true,    -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
    },
    { "typicode/bg.nvim",            lazy = false,      disable = true },
    { 'dasupradyumna/midnight.nvim', lazy = false },
    { "bluz71/vim-nightfly-colors",  name = "nightfly", lazy = false },
    { "roosta/srcery" },

    -- Configure LazyVim to load tokyonight
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
            -- colorscheme = "catppuccin",
            -- colorscheme = "midnight",
            -- colorscheme = "nightfly",
        },
    },
}
