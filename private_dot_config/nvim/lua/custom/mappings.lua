local M = {}

M.general = {
  n = {
    ["<leader>gg"] = { "<cmd> :LazyGit<CR>", "Toggle LazyGit" },
    ["<F1>"] = { "<Esc>" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "Live grep under cursor" },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window Left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window Down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window Up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window Right" },
  },
  i = {
    ["<F1>"] = { "<Esc>" },
  },
  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    ["<C-h>"] = {
      vim.api.nvim_replace_termcodes("<C-\\><C-N> <C-h>", true, true, true),
      "Escape terminal mode, Window Left",
    },
    ["<C-j>"] = {
      vim.api.nvim_replace_termcodes("<C-\\><C-N> <C-j>", true, true, true),
      "Escape terminal mode, Window Down",
    },
    ["<C-k>"] = {
      vim.api.nvim_replace_termcodes("<C-\\><C-N> <C-k>", true, true, true),
      "Escape terminal mode, Window Up",
    },
    ["<C-l>"] = {
      vim.api.nvim_replace_termcodes("<C-\\><C-N> <C-l>", true, true, true),
      "Escape terminal mode, Window Right",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    ["<leader>dt"] = {
      function()
        require("dap").open()
      end,
      "Debug start",
    },
    ["<leader>gs"] = {
      function()
        require("dap").continue()
      end,
      "Debug start",
    },
    ["<leader>dsi"] = {
      function()
        require("dap").step_into()
      end,
      "Debug Step into",
    },
    ["<leader>so"] = {
      function()
        require("dap").step_over()
      end,
      "Debug Step Over",
    },
    ["<leader>sO"] = {
      function()
        require("dap").step_out()
      end,
      "Debug Step Out",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgs"] = {
      function()
        require("dap").continue()
      end,
      "Debug go start",
    },
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsrj"] = {
      "<cmd> GoTagRm json <CR>",
      "Remove json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
    ["<leader>gsry"] = {
      "<cmd> GoTagRm yaml <CR>",
      "Remove yaml struct tags",
    },
    ["<leader>gat"] = {
      "<cmd> GoTestAdd <CR>",
      "Go Add tests ",
    },
    ["<leader>grt"] = {
      "<cmd> GoTestsAll <CR>",
      "Go run all tests ",
    },
    ["<leader>gie"] = {
      "<cmd> GoIfErr <CR>",
      "Generate Go If Err snippet",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

return M
