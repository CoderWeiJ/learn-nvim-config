-- colorscheme.lua
-- 设置主题
local colorscheme = "onedark"
local status_ok, onedark = pcall(require, colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " 没有找到！", vim.log.levels.ERROR)
    return
end

-- 配置主题设置
onedark.setup({
    style = "darker", -- 主题风格，可选值：'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
    transparent = true, -- 背景透明
    term_colors = true, -- 使用终端配色
    ending_tildes = false, -- 行尾显示波浪号
    toggle_style_key = "<leader>ts", -- 快捷键切换主题风格
    code_style = {
        comments = "italic", -- 注释样式
        keywords = "bold", -- 关键词样式
        functions = "italic,bold", -- 函数样式
        strings = "none", -- 字符串样式
        variables = "none" -- 变量样式
    },
    diagnostics = {
        darker = true, -- 更深的诊断配色
        undercurl = true, -- 启用下划线
        background = true -- 启用背景
    },
    statusline = {
        colors = {
            active = "#61AFEF", -- 当前活动窗口的颜色
            inactive = "#ABB2BF" -- 非活动窗口的颜色
        }
    }
})

-- 加载主题
onedark.load()
