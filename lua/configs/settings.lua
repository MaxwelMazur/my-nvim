vim.cmd([[ set guicursor= ]]) 
vim.cmd([[ set clipboard+=unnamedplus ]])
vim.cmd([[ set number ]])
vim.cmd([[ set relativenumber ]])
vim.cmd([[ set tabstop=4 ]])
vim.cmd([[ set shiftwidth=4 ]])
vim.cmd([[ set nowrap ]])
vim.cmd([[ set guifont=DroidSansMono\ Nerd\ Font\ Mono:h12 ]])
vim.cmd([[ set encoding=utf-8 ]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[ set bg=dark ]])
vim.cmd([[ set termguicolors ]])
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()

-- [ PARA ICONES ]
require('nvim-web-devicons').get_icons()

-- [ PARA BARRA DE STATUS ]
require "staline".setup {
	sections = {
		left = { 
			'▊', ' ', { 'Evil', ' ' },  'mode', { 'StalineGit', 'branch' }, ' ', 'lsp' 
		},
		mid = {},
		right = { { 'StalineFile', 'file_name' }, 'file_size', 'line_column' }
	},
	mode_colors = { n = "#38b1f0",
		i = "#9ece6a",       -- etc mode
		c = "#8583b3",
		v = "#c37cda",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
	}
}
vim.cmd [[hi Evil        guifg=#f36365 guibg=none]]       -- Higlight for Evil symbol
vim.cmd [[hi StalineEnc  guifg=#7d9955 guibg=none]]       -- Encoding Highlight
vim.cmd [[hi StalineGit  guifg=#8583b3 guibg=none]]       -- Branch Name Highlight
vim.cmd [[hi StalineFile guifg=#c37cda guibg=none]]       -- File name Highlight

require('nvim-autopairs').setup({
  enable_check_bracket_line = true 
})

require("transparent").setup({
  enable = true -- boolean: enable transparent
})

require('nvim_comment').setup(
	{
		comment_empty = false, 
		create_mappings = false,
	}
)

-- require('gitsigns').setup()
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = ' │', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = ' │', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = ' _', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = ' ‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = ' ~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 2
  },
  yadm = {
    enable = false
  },
}

-- The setup config table shows all available config options with their default values:
require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- require('go').setup()
require('go').setup({
  go='go', -- go command, can be go[default] or go1.18beta1
  goimport='gopls', -- goimport command, can be gopls[default] or goimport
  fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
  gofmt = 'gofumpt', --gofmt cmd,
  max_line_len = 120, -- max line length in goline format
  tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
  gotests_template = "", -- sets gotests -template parameter (check gotests for details)
  gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
  comment_placeholder = '' ,  -- comment_placeholder your cool placeholder e.g. ﳑ       
  icons = {breakpoint = '🧘', currentpos = '🏃'},  -- setup to `false` to disable icons setup
  verbose = false,  -- output loginf in messages
  lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
                   -- false: do nothing
                   -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
                   --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
                       --      when lsp_cfg is true
                       -- if lsp_on_attach is a function: use this function as on_attach function for gopls
  lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
  lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
  -- function(bufnr)
  --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
  -- end
  -- to setup a table of codelens
  lsp_diag_hdlr = true, -- hook lsp diag handler
  -- virtual text setup
  lsp_diag_virtual_text = { space = 0, prefix = "" },
  lsp_diag_signs = true,
  lsp_diag_update_in_insert = false,
  lsp_document_formatting = true,
  -- set to true: use gopls to format
  -- false if you want to use other formatter tool(e.g. efm, nulls)
  gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
  gopls_remote_auto = true, -- add -remote=auto to gopls
  dap_debug = true, -- set to false to disable dap
  dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
                           -- false: do not use keymap in go/dap.lua.  you must define your own.
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true, -- set to true to enable dap virtual text
  build_tags = "tag1,tag2", -- set default build tags
  textobjects = true, -- enable default text jobects through treesittter-text-objects
  test_runner = 'go', -- one of {`go`, `richgo`, `dlv`, `ginkgo`}
  verbose_tests = true, -- set to add verbose flag to tests
  run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
                           -- float term recommand if you use richgo/ginkgo with terminal color
})

-- Run gofmt + goimport on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

vim.cmd([[
	let g:go_fmt_fail_silently = 1
	let g:go_fmt_autosave = 0
]])
