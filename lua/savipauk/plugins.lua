return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install({
        "c", "cpp", "html", "javascript", "json", "typescript", "go", "lua", "query",
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter-highlight", {}),
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules" }
        }
      })
    end
  },

  {
    "loctvl842/monokai-pro.nvim",
  },

  {
    "ellisonleao/gruvbox.nvim",
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b3c35" })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#9d9e91" })
      end)
      require("ibl").setup({
        indent = { char = "▎" },
        scope = {
          show_start = false,
          show_end = false,
        },
      })
    end
  },


  {
      "echasnovski/mini.comment",
    version = false,
    config = function()
        require("mini.comment").setup()
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'mbbill/undotree',
  'tpope/vim-fugitive',

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
      },
    },
  }
}
