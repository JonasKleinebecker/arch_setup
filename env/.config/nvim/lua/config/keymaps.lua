vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open Oil file manager in floating window" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "[C]ode [F]ormat" })

-- Remap jump actions to also center on cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.set("x", "<leader>P", [["_dP]], { desc = "replace selected text without overwriting default buffer" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

--"vim" keybinds
vim.keymap.set("n", "<leader>vx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })
vim.keymap.set("n", "<leader>vs", "<cmd>source %<CR>", { silent = true, desc = "Source current file" })
vim.keymap.set("n", "<leader>vm", "<cmd>Mason<CR>", { silent = true, desc = "Mason" })
vim.keymap.set("n", "<leader>vl", "<cmd>Lazy<CR>", { silent = true, desc = "Lazy" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })

-- use öä instead of [] for navigation keymaps

-- buffers
vim.keymap.set("n", "öb", "[b", { desc = "Previous buffer" })
vim.keymap.set("n", "äb", "]b", { desc = "Next buffer" })
vim.keymap.set("n", "öB", "[B", { desc = "First buffer" })
vim.keymap.set("n", "äB", "]B", { desc = "Last buffer" })

-- diagnostics
vim.keymap.set("n", "öd", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "äd", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- quickfix / location list
vim.keymap.set("n", "öq", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
vim.keymap.set("n", "äq", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "öl", "<cmd>lprev<CR>", { desc = "Previous location list item" })
vim.keymap.set("n", "äl", "<cmd>lnext<CR>", { desc = "Next location list item" })

-- git hunks (gitsigns)
vim.keymap.set("n", "öh", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous git hunk" })
vim.keymap.set("n", "äh", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next git hunk" })

--highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader>ot", ":Obsidian tags ", { desc = "Search for notes with tag" })
vim.keymap.set("n", "<leader>oc", ":Obsidian new ", { desc = "Create new note" })
vim.keymap.set("n", "<leader>od", ":Obsidian today ", { desc = "Create new daily note" })
