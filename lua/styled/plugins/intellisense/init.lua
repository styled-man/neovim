local plugins = {
    "mason",
    "lspsaga",
    "lsp",
    "completions",
    "formatting",
    "lspsaga",
}

for _, plugin in ipairs(plugins) do
    require(Nvim_user .. ".plugins.intellisense." .. plugin)
end

