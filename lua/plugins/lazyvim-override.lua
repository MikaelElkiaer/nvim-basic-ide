local on_buffer_delete = function()
  local buf_id = vim.api.nvim_get_current_buf()
  local is_empty = vim.api.nvim_buf_get_name(buf_id) == "" and vim.bo[buf_id].filetype == ""
  if not is_empty then
    return
  end

  local orig_cwd = os.getenv("PWD")
  vim.fn.chdir(orig_cwd)
  vim.cmd("SessionDelete")
  require("mini.starter").open()
  vim.api.nvim_buf_delete(buf_id, {})
end

return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "gruvbox" },
  },
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "neo-tree.nvim",
    enabled = false,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Disable snippets in completion
      { "saadparwaiz1/cmp_luasnip", enabled = false },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      {
        "zbirenbaum/copilot-cmp",
        opts = {},
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Disable auto selection of first item in completion (1)
      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      })

      -- Disable auto selection of first item in completion (2)
      opts.preselect = require("cmp").PreselectMode.None

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "copilot" },
        { name = "nvim_lsp_signature_help" },
      }))

      -- callback for whenever cmp is triggered
      cmp.event:on("menu_opened", function()
        -- autocmd callback for before a char is inserted
        vim.api.nvim_create_autocmd("InsertCharPre", {
          callback = function(_)
            -- if no entry is selected do nothing
            if (cmp.get_selected_entry()) ~= nil then
              -- store the to-be-inserted char
              local c = vim.v.char
              -- clear the to-be-inserted char
              vim.v.char = ""
              -- vim schedule to circumvent `textlock`
              vim.schedule(function()
                -- confirm cmp selection - i. e. insert selected text
                cmp.confirm({ select = false })
                -- insert the stored char
                vim.api.nvim_feedkeys(c, "n", false)
              end)
            end
          end,
          once = true,
        })
      end)
    end,
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "echasnovski/mini.surround",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all other buffers" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function(...)
          require("mini.bufremove").delete(...)
          on_buffer_delete()
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function(...)
          require("mini.bufremove").wipeout(...)
          on_buffer_delete()
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = {
          enabled = false,
        },
      },
    },
  },
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = function(_, opts)
      opts.adapters = {
        ["neotest-dotnet"] = {},
      }
    end,
  },
}
