-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]];

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim');
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    use("nvim-telescope/telescope-file-browser.nvim")
    use('AstroNvim/astrotheme')
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })
    use('folke/tokyonight.nvim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('ThePrimeagen/vim-be-good')
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use("theprimeagen/refactoring.nvim")
    use('mbbill/undotree')
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    })
    use({
        "windwp/nvim-ts-autotag",
        config = function()
            require('nvim-ts-autotag').setup()
        end
    })
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lua")
    use("saadparwaiz1/cmp_luasnip")
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    })
    use({
        'filipdutescu/renamer.nvim',
        branch = 'master',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    use("numToStr/Comment.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lua/plenary.nvim")
    use("MunifTanjim/nui.nvim")
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    })
    use("lewis6991/gitsigns.nvim")
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })
    use("tpope/vim-fugitive")
    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use("f-person/git-blame.nvim")
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("barbecue").setup()
        end,
    })
    use("lukas-reineke/indent-blankline.nvim")
    use("RRethy/vim-illuminate")
    use("NvChad/nvim-colorizer.lua")
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })
    use("ray-x/aurora")
    use({ 'Everblush/nvim', as = 'everblush' })
    use("rktjmp/lush.nvim")
    use("kartikp10/noctis.nvim")
end)
