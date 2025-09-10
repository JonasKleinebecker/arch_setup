return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			fzf_opts = {
				["--layout"] = "default", -- show prompt at the bottom
			},
			files = {
				cwd_prompt = false, -- dont include cwd in file prompts
				cmd = "fd --type f --follow --hidden --exclude .git", -- follow symbolic links
			},
			keymap = {
				builtin = {
					["<C-j>"] = "preview-page-down",
					["<C-k>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-j"] = "preview-page-down",
					["ctrl-k"] = "preview-page-up",
				},
			},
		})
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files in Project Directory",
		}, -- uses project directory found via project.nvim plugin

		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = "~/.config" })
			end,
			desc = "Find Files in Config Folder",
		},

		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find String in Current Working Directory",
		},

		{
			"<leader>fg",
			function()
				require("fzf-lua").git_files()
			end,
			desc = "Find Files in Git Files",
		},

		{
			"<leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "Find Builtin FZF-Finders",
		},

		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "Find inside NVIM Help",
		},

		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "Find Keymaps",
		},

		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Find Old Files",
		},

		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "Live Grep the Current Buffer",
		},
	},
}
