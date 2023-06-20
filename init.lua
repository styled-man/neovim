Nvim_user = "styled"

local plugins = {
    "plugins",
    "config.keymaps",
    "config.options",
    "config.colorscheme"
}

for _, plugin in ipairs(plugins) do
    require(Nvim_user .. "." .. plugin)
end

