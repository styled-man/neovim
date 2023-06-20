local configs = {
    "lazy",
    "intellisense",
    "telescope",
    "treesitter",
    "mini-pairs",
    "comments",
    "buffer",
    "indent",
    "dashboard",
    "lualine",
    "file-explorer",
}

for _, config in ipairs(configs) do
    require(Nvim_user .. ".plugins." .. config)
end
