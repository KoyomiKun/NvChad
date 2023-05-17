local M = {}

M.mine = {
  n = {
    ["<S-s>"] = {":w<CR>", "Save file"},
    ["<S-q>"] = {":q<CR>", "Quit file"},
    ["sd"] = {":set splitright<CR> :vsplit<CR>", "split right"},
    ["=="] = {"$", "last token", noremap = true },
    ["--"] = {"0", "fist token", noremap = true },
    ["<LEADER><RIGHT>"] = {"<C-w>l", "Move to right window"},
    ["<LEADER><LEFT>"] = {"<C-w>h", "Move to left window"},
    ["<LEADER><DOWN>"] = {"<C-w>j", "Move to below window"},
    ["<LEADER><UP>"] = {"<C-w>k", "Move to upper window"},
    ["tp"] = {":noh<CR>", "ignore select section"},
    ["<LEADER>r"] = {":lua require'telescope.builtin'.lsp_document_symbols{}<CR>", "open tagbar"},
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<LEADER>db"] = {
      "<CMD> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<LEADER>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open()
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<LEADER>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<LEADER>dgl"] = {
      function ()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.go = {
  plugin = true,
  n = {
    ["<LEADER>gtj"] = {
      ":GoTagAdd json<CR>",
      "add json tag for struct",
    }
  }
}

M.rust = {
  n = {
    ["<LEADER>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "Update crates"
    }
  }
}

return M
