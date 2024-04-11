return {
	{
		'stevearc/oil.nvim',
		opts = {
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				['<C-c>'] = '<Esc>'
			}
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	}
}
