local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      }
    }
  },
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("go")
    end,
    config = function (_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_,opts)
      require("gopher").setup(opts)
    end,

    build = function ()
      vim.cmd [[slient! GoInstallDeps]]
    end

  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  }, 
}
return plugins
