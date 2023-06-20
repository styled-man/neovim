local mini_pairs_status, mini_pair = pcall(require, "mini.pairs")
if not mini_pairs_status then
	print("Could not locate `mini-pairs` plugin!")
end

mini_pair.setup({})

local nvim_ts_autotag_status, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")
if not nvim_ts_autotag_status then
	print("Could not locate `nvim-ts-autotag` plugin!")
end

nvim_ts_autotag.setup()
