-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
    return
end

lualine.setup({
    options = {
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        theme = "onedark",
        component_separators = {
            left = "|",
            right = "|"
        },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = {
            left = " ",
            right = ""
        }
    },
    extensions = {"nvim-tree", "toggleterm"},
    sections = {
        lualine_c = {"filename", {
            "lsp_progress",
            spinner_symbols = {" ", " ", " ", " ", " ", " "}
        }},
        lualine_x = {"filesize", {
            "fileformat",
            -- symbols = {
            --   unix = '', -- e712
            --   dos = '', -- e70f
            --   mac = '', -- e711
            -- },
            symbols = {
                unix = "LF",
                dos = "CRLF",
                mac = "CR"
            }
        }, "encoding", "filetype"}
    }
})
