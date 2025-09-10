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

--highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

function toggle_checkbox()
	local line = vim.api.nvim_get_current_line()

	if line:match("^%s*-%s*%[ %]") then
		local new_line = line:gsub("%[ %]", "[x]")
		vim.api.nvim_set_current_line(new_line)
	elseif line:match("^%s*-%s*%[x%]") then
		local new_line = line:gsub("%[x%]", "[ ]")
		vim.api.nvim_set_current_line(new_line)
	else
		print("No checkbox found on this line")
	end
end

vim.keymap.set("n", "<leader>tc", toggle_checkbox, { noremap = true, silent = true, desc = "Toggle markdown checkbox" })
