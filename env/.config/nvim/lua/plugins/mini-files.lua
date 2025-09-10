return {
	"echasnovski/mini.files",
	version = false,
	config = function()
		require("mini.files").setup({})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesWindowUpdate",
			callback = function(args)
				local cfg = vim.api.nvim_win_get_config(args.data.win_id)
				cfg.border = "rounded"
				vim.api.nvim_win_set_config(args.data.win_id, cfg)

				vim.api.nvim_win_call(args.data.win_id, function()
					vim.wo.number = true
					vim.wo.relativenumber = true
				end)
			end,
		})
	end,
}
