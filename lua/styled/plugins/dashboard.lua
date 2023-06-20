local alpha_status, alpha = pcall(require, "alpha")
if not alpha_status then
    print("Could not locate `alpha` plugin!")
    return
end

local persistence_status, persistence = pcall(require, "persistence")
if not persistence_status then
    print("Could not locate `persistence plugin`!\n Some features will not work on the dash")
end

persistence.setup({})


local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
    dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰱼 " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("s", "󰍉 " .. " Search", ":Telescope live_grep <CR>"),
    dashboard.button("rs", "󰦛 " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
    dashboard.button("q", "󰗼 " .. " Exit", ":qa <CR>")
}

alpha.setup(dashboard.config)
