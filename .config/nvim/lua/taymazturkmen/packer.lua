-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- You can specify rocks in isolation
  use_rocks 'penlight'
  use_rocks {'lua-resty-http', 'lpeg'}

  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with call of vimscript function with argument
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  
  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
  
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })


    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
	
    use 'ThePrimeagen/harpoon'

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'
    use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v2.x',
  	requires = {
    	-- LSP Support
    	{'neovim/nvim-lspconfig'},             -- Required
    	{                                      -- Optional
      	'williamboman/mason.nvim',
      	run = function()
        	pcall(vim.cmd, 'MasonUpdate')
      	end,
    	},
    	{'williamboman/mason-lspconfig.nvim'}, -- Optional
    	-- Autocompletion
    	{'hrsh7th/nvim-cmp'},     -- Required
    	{'hrsh7th/cmp-nvim-lsp'}, -- Required
    	{'L3MON4D3/LuaSnip'},     -- Required
  		}
   	}

	use { "zbirenbaum/copilot.lua" }

	use {
  	"zbirenbaum/copilot-cmp",
  	after = { "copilot.lua" },
  	config = function ()
    		require("copilot_cmp").setup()
  	end
	}
end)
