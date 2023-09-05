local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "goimports",
        "shfmt",
        "shellcheck",
        "gopls",
        "rust-analyzer",
        "jedi-language-server",
        "lua-language-server"
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
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name="crates"})
      return M
    end
  },
  {
    "chentoast/marks.nvim",
    opts = function ()
      return require "custom.configs.marks"
    end,
    config = function (_, opts)
      require('marks').setup(opts)
    end,
    lazy = false,
  },
}
return plugins
