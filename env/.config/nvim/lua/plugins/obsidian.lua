return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		callbacks = {
			enter_note = function(note)
				vim.keymap.set("n", "<leader>tc", "<cmd>Obsidian toggle_checkbox<cr>", {
					buffer = true,
					desc = "Toggle checkbox",
				})
			end,
		},
		checkbox = {
			order = { " ", "x" },
		},
		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return suffix .. ".md"
		end,
		legacy_commands = false, -- this will be removed in the next major release
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
		},
	},
}
