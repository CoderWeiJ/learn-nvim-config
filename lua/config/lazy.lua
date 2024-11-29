-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- 这里在keybindings.lua里配置了，并且是本文件先加载
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = { -- import your plugins
    {
        import = "plugins.init"
    }},
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- install = {
    --     colorscheme = {"onedark"}
    -- },
    -- automatically check for plugin updates
    checker = {
        enabled = true, -- 保持检查更新
        notify = false -- 禁用更新通知
    }
})

-- 每次保存 plugins.lua 自动安装插件
pcall(vim.cmd, [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | LazySync
    augroup end
  ]])
