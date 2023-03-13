local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    use { "bluz71/vim-nightfly-colors", as = "nightfly" }

    use("folke/tokyonight.nvim")
    use("christoomey/vim-tmux-navigator") -- moving tab by press Ctrl + i, j, k l
    use("szw/vim-maximizer") -- maximizes and restore current window. kepmap was set by <leader>sm


    -- essential plugins
    use("tpope/vim-surround") -- can surround jobs by ys, ds, cs command. 
    use("vim-scripts/ReplaceWithRegister") -- can replace copied registered unnamed by grw

    -- commenting with gc
    use("numToStr/Comment.nvim") -- line commeting: gcj, n-line commenting: gc*n*j 


    -- file explorer
    use("nvim-tree/nvim-tree.lua") -- set keymap by pressing <leader>e
    -- Can add a file in folder by type 'a' and filename


    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- fuzzy finding
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"}) -- dependency for better sorting performance
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x",
        requires={ {'nvim-lua/plenary.nvim'}}
    }) -- fuzzy finder
    use({"nvim-telescope/telescope-ui-select.nvim"}) -- for showing lsp code actions


    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer") -- auto completions via buffer
    use("hrsh7th/cmp-path") -- auto completions with path


    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")


    -- managing & installing lsp servers

    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- configuring lsp servers
    use("neovim/nvim-lspconfig")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
