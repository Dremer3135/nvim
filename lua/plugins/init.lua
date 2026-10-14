return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "c_sharp",
        "svelte", "typescript", "javascript", "tsx",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "svelte-language-server",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "emmet-language-server",
        "tailwindcss-language-server",
        "prettier",
        "omnisharp",
        "netcoredbg",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    submodules = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }

      local set_hl = function()
        vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#e06c75" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#e5c07b" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61afef" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#d19a66" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98c379" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#c678dd" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56b6c2" })
      end
      set_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })
    end,
  },
}
