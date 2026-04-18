return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				preview = {
					vertical = "up:55%",
				},
			},
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
			"<leader>fn",
			function()
				require("fzf-lua").files({
					cwd = "~/vaults",
					cmd = "fd --type f --extension md",
				})
			end,
			desc = "Find Markdown Files in Notes Vaults",
		},

		{
			"<leader>fl",
			function()
				require("fzf-lua").live_grep({
					cwd = "~/vaults",
				})
			end,
			desc = "Live Grep in Notes Vaults",
		},

		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Live Grep in Current Working Directory",
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
			"<leader>ft",
			function()
				require("fzf-lua").fzf_exec([[rg -n '\[ \]' ~/vaults/personal; rg -n '\[x\]' ~/vaults/personal]], {
					prompt = "Todos❯ ",
					fzf_opts = {
						["--delimiter"] = ":",
						["--with-nth"] = "3..",
					},

					-- use builtin nvim previewer
					previewer = "builtin",

					actions = {
						-- ENTER → open in nvim at line (like your become)
						["default"] = function(selected)
							local entry = selected[1]
							local file, line = entry:match("([^:]+):(%d+):")
							vim.cmd("edit +" .. line .. " " .. file)
						end,

						-- CTRL-X → toggle checkbox + reload
						["ctrl-x"] = {
							fn = function(selected)
								for _, entry in ipairs(selected) do
									local file, line = entry:match("([^:]+):(%d+):")
									vim.fn.system(
										string.format(
											[[sed -i '%ss/\[ \]/[x]/; t; %ss/\[x\]/[ ]/' %s]],
											line,
											line,
											file
										)
									)
								end
							end,
							reload = true, -- this is your reload-sync equivalent
						},
					},
				})
			end,
			desc = "Search for open todos in notes",
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
