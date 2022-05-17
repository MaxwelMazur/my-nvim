vim.cmd([[ set guicursor= ]]) 
vim.cmd([[ set clipboard+=unnamedplus ]])
vim.cmd([[ set number ]])
vim.cmd([[ set relativenumber ]])
vim.cmd([[ set tabstop=2 ]])
vim.cmd([[ set shiftwidth=2 ]])
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
