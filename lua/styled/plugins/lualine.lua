local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
    print("Could not locate `lualine` plugin!")
    return
end


lualine.setup({
    options = {
        globalstatus = true
    },
    extensions = { "neo-tree", "lazy" }
})
