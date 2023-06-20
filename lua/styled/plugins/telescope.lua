local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	print("Could not locate `telescope` plugin!")
	return
end

telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

local builtin = require("telescope.builtin")

local keymap = vim.keymap.set

keymap("n", "<C-p>", builtin.find_files, {})
keymap("n", "<C-S-p>", builtin.oldfiles, {})
keymap("n", "<leader>pg", builtin.git_files, {})
keymap("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
