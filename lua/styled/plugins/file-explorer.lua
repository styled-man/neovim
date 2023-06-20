local neo_tree_status, neo_tree = pcall(require, "neo-tree")
if not neo_tree_status then
	print("Could not locate `neo-tree` plugin!")
	return
end

neo_tree.setup({
	enable_diagnostics = true,
	default_component_configs = {
		modified = {
			symbol = "M",
			highlight = "NeoTreeModified",
		},
		icon = {
			folder_empty = "",
		},
		git_status = {
			symbols = {
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "R", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰲶",
				staged = "",
				conflict = "",
			},
		},
	},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
	},
})
