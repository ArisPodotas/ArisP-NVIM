-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup { sync_install = true,
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'vimdoc', 'vim', 'bash', 'perl', 'javascript', 'html', 'css' }, -- 'go', 'tsx', 'typescript'
    modules = {},
    ignore_install = {},

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gss',
        scope_incremental = 'gsi',
        node_incremental = 'gsn',
        node_decremental = 'gsd',
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          ['iee'] = '@assignment.inner',
          ['iel'] = '@assignment.lhs',
          ['ae'] = '@assignment.outer',
          ['ier'] = '@assignment.rhs',
          ['ia'] = '@attribute.inner',
          ['aa'] = '@attribute.outer',
          ['ib'] = '@block.inner',
          ['ab'] = '@block.outer',
          ['ik'] = '@call.inner',
          ['ak'] = '@call.outer',
          ['io'] = '@comment.inner',
          ['ao'] = '@comment.outer',
          ['im'] = '@frame.inner',
          ['am'] = '@frame.outer',
          ['in'] = '@number.inner',
          ['ix'] = '@regex.inner',
          ['ax'] = '@regex.outer',
          ['ir'] = '@return.inner',
          ['ar'] = '@return.outer',
          ['is'] = '@scopename.inner',
          ['as'] = '@statement.outer',
          ['av'] = '@parameter.outer',
          ['iv'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['ai'] = '@conditional.outer',
          ['ii'] = '@conditional.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ['gje'] = '@assignment.outer',
          ['gja'] = '@attribute.outer',
          ['gjb'] = '@block.outer',
          ['gjk'] = '@call.outer',
          ['gjo'] = '@comment.outer',
          ['gjm'] = '@frame.outer',
          ['gjx'] = '@regex.outer',
          ['gjr'] = '@return.outer',
          ['gjs'] = '@statement.outer',
          ['gjp'] = '@parameter.outer',
          ['gjf'] = '@function.outer',
          ['gjc'] = '@class.outer',
          ['gjl'] = '@loop.outer',
          ['gji'] = '@conditional.outer',
        },
        goto_next_end = {
          ['gJe'] = '@assignment.outer',
          ['gJa'] = '@attribute.outer',
          ['gJb'] = '@block.outer',
          ['gJk'] = '@call.outer',
          ['gJo'] = '@comment.outer',
          ['gJm'] = '@frame.outer',
          ['gJx'] = '@regex.outer',
          ['gJr'] = '@return.outer',
          ['gJs'] = '@statement.outer',
          ['gJp'] = '@parameter.outer',
          ['gJf'] = '@function.outer',
          ['gJc'] = '@class.outer',
          ['gJl'] = '@loop.outer',
          ['gJi'] = '@conditional.outer',
        },
        goto_previous_start = {
          ['gke'] = '@assignment.outer',
          ['gka'] = '@attribute.outer',
          ['gkb'] = '@block.outer',
          ['gkk'] = '@call.outer',
          ['gko'] = '@comment.outer',
          ['gkm'] = '@frame.outer',
          ['gkx'] = '@regex.outer',
          ['gkr'] = '@return.outer',
          ['gks'] = '@statement.outer',
          ['gkp'] = '@parameter.outer',
          ['gkf'] = '@function.outer',
          ['gkc'] = '@class.outer',
          ['gkl'] = '@loop.outer',
          ['gki'] = '@conditional.outer',
        },
        goto_previous_end = {
          ['gKe'] = '@assignment.outer',
          ['gKa'] = '@attribute.outer',
          ['gKb'] = '@block.outer',
          ['gKk'] = '@call.outer',
          ['gKo'] = '@comment.outer',
          ['gKm'] = '@frame.outer',
          ['gKx'] = '@regex.outer',
          ['gKr'] = '@return.outer',
          ['gKs'] = '@statement.outer',
          ['gKp'] = '@parameter.outer',
          ['gKf'] = '@function.outer',
          ['gKc'] = '@class.outer',
          ['gKl'] = '@loop.outer',
          ['gKi'] = '@conditional.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>je'] = '@assignment.inner',
          ['<leader>ja'] = '@attribute.inner',
          ['<leader>jb'] = '@block.inner',
          ['<leader>jk'] = '@call.inner',
          ['<leader>jo'] = '@comment.inner',
          ['<leader>jm'] = '@frame.inner',
          ['<leader>jx'] = '@regex.inner',
          ['<leader>jr'] = '@return.inner',
          ['<leader>js'] = '@statement.inner',
          ['<leader>jp'] = '@parameter.inner',
          ['<leader>jf'] = '@function.inner',
          ['<leader>jc'] = '@class.inner',
          ['<leader>jl'] = '@loop.inner',
          ['<leader>ji'] = '@conditional.inner',
        },
        swap_previous = {
          ['<leader>ke'] = '@assignment.inner',
          ['<leader>ka'] = '@attribute.inner',
          ['<leader>kb'] = '@block.inner',
          ['<leader>kk'] = '@call.inner',
          ['<leader>ko'] = '@comment.inner',
          ['<leader>km'] = '@frame.inner',
          ['<leader>kx'] = '@regex.inner',
          ['<leader>kr'] = '@return.inner',
          ['<leader>ks'] = '@statement.inner',
          ['<leader>kp'] = '@parameter.inner',
          ['<leader>kf'] = '@function.inner',
          ['<leader>kc'] = '@class.inner',
          ['<leader>kl'] = '@loop.inner',
          ['<leader>ki'] = '@conditional.inner',
        },
      },
    },
  }
end, 0)

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap -- Switched to H left the comment in case i need to change it back and a good reason exists
  nmap('H', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- document existing key chains
require('which-key').register {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  ['<leader>i'] = { name = 'Vertical spl[I]ts', _ = 'which_key_ignore' },
  ['<leader>u'] = { name = 'Horizontal splits', _ = 'which_key_ignore' },
  ['<leader>j'] = { name = 'Swap Next', _ = 'which_key_ignore' },
  ['<leader>k'] = { name = 'Swap Previous', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
  ['<leader>'] = { name = 'VISUAL <leader>' },
  ['<leader>h'] = { 'Git [H]unk' },
}, { mode = 'v' })

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  clangd = {},
  -- gopls = {},
  pyright = {},
  -- python lsp = {}
  perlnavigator = {},
  powershell_es = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs'} },
  tsserver = {},
  cssls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}

local harpoon = require("harpoon")
harpoon:setup({})

-- local highlight = {
-- --     -- "RainbowRed",
-- --     -- "RainbowYellow",
-- --     -- "RainbowBlue",
-- --     -- "RainbowOrange",
--     "RainbowGreen",
-- --     -- "RainbowViolet",
-- --     -- "RainbowCyan",
-- }
--
-- local hooks = require "ibl.hooks"
-- -- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
-- --     -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
-- --     -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
-- --     -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
-- --     -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
--     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
-- --     -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
-- --     -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)

-- require("ibl").setup()
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

