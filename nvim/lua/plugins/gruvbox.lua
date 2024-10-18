--------------------------------------------------------------------------------
-- GRUVBOX.NVIM
--------------------------------------------------------------------------------
-- https://github.com/ellisonleao/gruvbox.nvim
return { 
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        -- default conf
        require("gruvbox").setup({
            terminal_color = true,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_indent_guides = false,
            inverse = true,
            contrast = "",
            palette_overries = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = vim.g.transparent_enabled
        })
        -- user conf
        vim.o.background = "dark"
        vim.cmd([[
          colorscheme gruvbox
          highlight Normal guibg=none
          highlight NonText guibg=none
          highlight Normal ctermbg=none
          highlight NonText ctermbg=none
          highlight NormalFloat guibg=none
      ]])
    end,
}

