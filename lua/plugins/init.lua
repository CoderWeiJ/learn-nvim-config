return {{
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false
    -- config = function()
    --     require("config.plugins.colorscheme")
    -- end
}, -- 主题
{
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons"
}, -- nvim-tree插件
{
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {'nvim-tree/nvim-web-devicons', "moll/vim-bbye"}
}, -- bufferLine插件
{
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'}
}, -- lualine
{'arkav/lualine-lsp-progress'}}
