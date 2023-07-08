lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
vim.opt.relativenumber = true
lvim.format_on_save.enabled = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.lualine.sections.lualine_a = {
  { 'mode', separator = { left = '' }, right_padding = 2 },
}
lvim.builtin.lualine.sections.lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

lvim.plugins = {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
      { 'kkharji/sqlite.lua' },
    },
    config = function()
      require('neoclip').setup()
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  }, {
  "themaxmarchuk/tailwindcss-colors.nvim",
  -- load only on require("tailwindcss-colors")
  -- run the setup function after plugin is loaded
  config = function()
    -- pass config options here (or nothing to use defaults)
    require("tailwindcss-colors").setup()
  end
}, {
  'anuvyklack/pretty-fold.nvim',
  config = function()
    require('pretty-fold').setup()
  end
}, {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {
      -- your config goes here
      -- or just leave it empty :)
    }
  end,
},
  { 'shaunsingh/nord.nvim' },
  {
    'sainnhe/edge',
    config = function()
      vim.g.edge_style = 'neon'
    end
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
      })
    end
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "tpope/vim-surround",

  },
  { "ray-x/lsp_signature.nvim" }
  ,
  {
    "wakatime/vim-wakatime"
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end,

  }, {
  'ethanholz/nvim-lastplace'
}, {
  'iamcco/markdown-preview.nvim'
},
  {
    'Exafunction/codeium.vim',
    config = function()
      -- Change '<C-g>' here to any keycode you like.

      vim.keymap.set('i', '<Right>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },
  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  }
}

lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.terminal.direction = 'horizontal'

lvim.keys.normal_mode["<A-h>"] = "<Cmd>bp<CR>"
lvim.keys.normal_mode["<A-l>"] = "<Cmd>bn<CR>"
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'vue', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})
local opts = { noremap = true, silent = true }

local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true
  })
end
vim.keymap.set('n', '<leader>qf', quickfix, opts)
vim.keymap.set('v', '<leader>p', 'pgvy')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', function()
  require('telescope').extensions.neoclip.default()
end)
vim.keymap.set('n', '<A-?>', ':bdelete<CR>')
vim.keymap.set('n', '<A-?>', ':bdelete<CR>')
vim.keymap.set('n', '<Tab>', '$')
vim.keymap.set('v', '<Tab>', '$')
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
  desc = "Open Spectre"
})

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 10000 }
  end,
  "Format",
}

local uv = require("luv")

local current_time = ""
local function set_interval(interval, callback)
  local timer = uv.new_timer()
  local function ontimeout()
    callback(timer)
  end
  uv.timer_start(timer, interval, interval, ontimeout)
  return timer
end

local function update_wakatime()
  local stdin = uv.new_pipe()
  local stdout = uv.new_pipe()
  local stderr = uv.new_pipe()

  local handle, pid =
      uv.spawn(
        "wakatime",
        {
          args = { "--today" },
          stdio = { stdin, stdout, stderr }
        },
        function(code, signal) -- on exit
          stdin:close()
          stdout:close()
          stderr:close()
        end
      )

  uv.read_start(
    stdout,
    function(err, data)
      assert(not err, err)
      if data then
        current_time = "🅆 " .. data:sub(1, #data - 2) .. " "
      end
    end
  )
end

set_interval(5000, update_wakatime)
local components = require("lvim.core.lualine.components")
local function get_wakatime()
  return current_time
end
lvim.builtin.lualine.sections.lualine_y = { get_wakatime }
lvim.builtin.lualine.sections.lualine_x = { components.lsp, 'filetype',
  { "require('lsp-progress').progress()" } }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "vue" },
  },
}
