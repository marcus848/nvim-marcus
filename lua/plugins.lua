return {
	-- add comment.nvim
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
			padding = true,
			sticky = true,
			ignore = nil,
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				above = 'gcO',
				below = 'gco',
				eol = 'gcA',
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = nil,
			post_hook = nil,
		}
	},

	-- add github copilot
	{
		"github/copilot.vim",
		config = function()
		-- Desabilita o mapeamento de <Tab> para aceitar a sugestão
		vim.g.copilot_no_tab_map = true

		-- Mapeia Ctrl+J para aceitar a sugestão
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	-- add markdown views
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},


	{
		"ellisonleao/glow.nvim", 
		config = true, 
		cmd = "Glow"
	},

	{ "plasticboy/vim-markdown" },

	{ "junegunn/vim-easy-align" },
	
	--############### TEMAS ################
	-- Tema Tokio Night
	{
		'folke/tokyonight.nvim',
	},

	-- Tema Gruvbox
	{
		'morhetz/gruvbox',
	},

	-- Tema Nightfox
	{
		'EdenEast/nightfox.nvim',
	},

	-- Tema Dracula
	{
		'Mofiqul/dracula.nvim',
	},

	-- Tema Nord
	{
		'shaunsingh/nord.nvim',
	},

}
