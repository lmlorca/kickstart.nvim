-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.stylua,
        },
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ''
      vim.keymap.set('i', '<S-cr>', function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end, { expr = true, silent = true })
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  -- {
  --   'aktersnurra/no-clown-fiesta.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('no-clown-fiesta').setup {
  --       transparent = false, -- Enable this to disable the bg color
  --       styles = {
  --         -- You can set any of the style values specified for `:h nvim_set_hl`
  --         comments = {},
  --         keywords = {},
  --         functions = {},
  --         variables = {},
  --         type = { bold = true },
  --         lsp = { underline = true },
  --       },
  --     }
  --
  --     vim.cmd [[colorscheme no-clown-fiesta]]
  --   end,
  -- },
  {
    'marko-cerovac/material.nvim',
    config = function()
      require('material').setup {

        contrast = {
          terminal = false,           -- Enable contrast for the built-in terminal
          sidebars = false,           -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = false,   -- Enable contrast for floating windows
          cursor_line = false,        -- Enable darker background for the cursor line
          non_current_windows = true, -- Enable contrasted background for non-current windows
          filetypes = {},             -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
          comments = { --[[ italic = true ]]
          },
          strings = { --[[ bold = true ]]
          },
          keywords = { --[[ underline = true ]]
          },
          functions = { --[[ bold = true, undercurl = true ]]
          },
          variables = {},
          operators = {},
          types = {},
        },

        plugins = { -- Uncomment the plugins that you use to highlight them
          -- Available plugins:
          -- "dap",
          -- "dashboard",
          -- "eyeliner",
          -- "fidget",
          -- "flash",
          'gitsigns',
          -- "harpoon",
          -- "hop",
          -- "illuminate",
          'indent-blankline',
          -- "lspsaga",
          -- "mini",
          -- "neogit",
          -- "neotest",
          -- "neo-tree",
          -- "neorg",
          -- "noice",
          -- "nvim-cmp",
          -- "nvim-navic",
          -- "nvim-tree",
          -- "nvim-web-devicons",
          -- "rainbow-delimiters",
          -- "sneak",
          'telescope',
          -- 'trouble',
          'which-key',
        },

        disable = {
          colored_cursor = false, -- Disable the colored cursor
          borders = false,        -- Disable borders between verticaly split windows
          background = false,     -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false,    -- Prevent the theme from setting terminal colors
          eob_lines = false,      -- Hide the end-of-buffer lines
        },

        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = false,  -- Enable higher contrast text for darker style
        },

        lualine_style = 'stealth', -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true,      -- Load parts of the theme asyncronously for faster startup (turned on by default)

        custom_colors = nil,       -- If you want to override the default colors, set this to a function

        custom_highlights = {},    -- Overwrite highlights with your own
      }

      vim.g.material_style = 'darker'

      vim.cmd [[colorscheme material]]
    end,
  },
  -- {
  --   -- Theme inspired by Atom
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('onedark').setup {
  --       -- Main options --
  --       style = 'warmer',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  --       transparent = true,           -- Show/hide background
  --       term_colors = true,           -- Change terminal color as per the selected theme style
  --       ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  --       cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  --
  --       -- toggle theme style ---
  --       toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  --       toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
  --
  --       -- Change code style ---
  --       -- Options are italic, bold, underline, none
  --       -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  --       code_style = {
  --         comments = 'italic',
  --         keywords = 'bold',
  --         functions = 'none',
  --         strings = 'none',
  --         variables = 'none',
  --       },
  --
  --       -- Lualine options --
  --       lualine = {
  --         transparent = false, -- lualine center bar transparency
  --       },
  --
  --       -- Custom Highlights --
  --       colors = {}, -- Override default colors
  --       highlights = {
  --         TelescopeBorder = { bg = 'none' },
  --         -- TelescopeNormal = { bg = 'none' },
  --         -- Normal = { bg = 'none' },
  --         -- NormalFloat = { bg = 'none' },
  --       }, -- Override highlight groups
  --
  --       -- Plugins Config --
  --       diagnostics = {
  --         darker = true,     -- darker colors for diagnostic
  --         undercurl = true,  -- use undercurl instead of underline for diagnostics
  --         background = true, -- use background color for virtual text
  --       },
  --     }
  --
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        -- theme = 'material',
        component_separators = '|',
        section_separators = '',
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'filename',
            file_status = false, -- displays file status (readonly status, modified status)
            path = 1,            -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },
}
