-- Install packer if not installed already
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Editing
    use {'tpope/vim-surround',event = "BufReadPost"}
    use {'tpope/vim-unimpaired',event="BufReadPost"}
    use {'tpope/vim-repeat',event = "BufReadPost"}
    use {'tpope/vim-commentary',event = "BufReadPost"}
    use {'tpope/vim-abolish',event = "BufReadPost"}
    use {'romainl/vim-cool', event = "BufReadPost"}
    use {
        'L3MON4D3/LuaSnip',
        requires = {
            'rafamadriz/friendly-snippets',
            after = "LuaSnip",
            event = "InsertEnter",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        opt = true,
        wants = {
            "cmp-nvim-lsp",
        },
        event = "BufReadPre",
        config = [[require('plugins.lsp')]],
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'neovim/nvim-lspconfig'}
        },
        event = "BufReadPre",
        config = function()
            require('plugins.null_ls')
        end
    }

    use {
        'folke/trouble.nvim',
        event = "BufReadPre,InsertEnter",
        module = 'trouble',
        config = function()
            require("trouble").setup {
                mode = "document_diagnostics",
                action_keys = {
                    close = "q",
                    cancel = "<esc>",
                    refresh = "r",
                    jump = {"<cr>", "<tab>"},
                    jump_close = {"o"},
                    toggle_mode = "m",
                    toggle_preview = "P",
                    hover = "K",
                    preview = "p",
                    close_folds = {"zM", "zm"},
                    open_folds = {"zR", "zr"},
                    toggle_fold = {"zA", "za"},
                    previous = "[q",
                    next = "]q",
                }
            }
        end
    }

    use 'folke/lua-dev.nvim'

    use {
        'folke/which-key.nvim',
        event = "VimEnter",
        config = function()
            require("which-key").setup {
                plugins = {
                    spelling = {
                        enabled = true,
                        suggestions = 20
                    }
                }
            }
        end
    }

    use {
        'nvim-lua/plenary.nvim',
        module = "plenary"
    }

    use {
        'lewis6991/gitsigns.nvim',
        event = "BufReadPre",
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup{
                signs = {
                    add = {text = "▎"},
                    change = {text = "▎"},
                    delete = {text = "▎"},
                    topdelete = {text = "▎"},
                    changedelete = {text = "▎"}
                },
                keymaps = {
                    noremap = true,
                    buffer = true,
                    ['n ]g'] = '<cmd>Gitsigns next_hunk<CR>',
                    ['n [g'] = '<cmd>Gitsigns prev_hunk<CR>',
                    ['n ,gu'] = '<cmd>Gitsigns reset_hunk<CR>',
                    ['n ,gp'] = '<cmd>Gitsigns preview_hunk<CR>',
                    ['n ,ga'] = '<cmd>Gitsigns stage_hunk<CR>',
                }
            }
        end
    }

    -- Tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        opt = true,
        event = "BufRead",
        requires = {
            {'nvim-treesitter/nvim-treesitter-textobjects'},
        },
        config = [[require('plugins/treesitter')]],
    }

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    -- Telescope
    use({ "nvim-lua/popup.nvim", module = "popup" })
    use {
        'nvim-telescope/telescope.nvim',
        opt = true,
        keys = {",rf", ",b", ",F", "<M-x>", ",h", ",rg", ",gv", ",v", ",ct"},
        cmd = { "Telescope" },
        wants = {
            'plenary.nvim',
            'popup.nvim',
            'trouble.nvim'
        },
        config = function()
            require('plugins/telescope')
        end
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Smooth scroll
    use {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        event = "BufReadPost"
    }

    use {
        'kyazdani42/nvim-web-devicons',
        event = "VimEnter"
    }

    -- Git
    use {
        'tpope/vim-fugitive',
        event = "VimEnter",
    }

    use {
        'hrsh7th/nvim-cmp',
        opt = true,
        event = "InsertEnter",
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        },
        wants = {
            "lspkind-nvim",
        },
        config = [[require('plugins.cmp')]],
    }

    use {
        "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup()
        end
    }

    use {
        'feline-nvim/feline.nvim',
        branch = '0.5-compat',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            -- require("plugins.feline").setup()
        end
    }

    use("nathom/filetype.nvim")

    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        cmd = "Neogit"
    }

end)
