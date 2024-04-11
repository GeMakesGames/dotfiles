return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make'
			},
			'nvim-telescope/telescope-ui-select.nvim',
		},
		config = function()
			require('telescope').setup({
				extensions = {
					['ui-select'] = {
			require('telescope.themes').get_dropdown(),
					},
				},
			})
			pcall(require('telescope').load_extension, 'fzf')
			pcall(require('telescope').load_extension, 'ui-select')
		end
	}
}
