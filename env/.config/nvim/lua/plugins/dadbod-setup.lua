return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod" },
		{ "kristijanhusak/vim-dadbod-completion" },
	},
	keys = {
		{ "<leader>db", "<cmd>DBUI<CR>", desc = "Open [D]ata[B]ase UI" },
	},
}
