local indent_blankline_status, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_status then
    print("Could not locate `indent_blankline` plugin!")
    return
end

indent_blankline.setup({
    char = "▏",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
    show_trailing_blankline_indent = false,
    show_current_context = false,
})

local indentscope_status, indentscope = pcall(require, "mini.indentscope")
if not indentscope_status then
    print("Could not locate `indent_blankline` plugin!")
    return
end

indentscope.setup({
    symbol = "▏",
    options = { try_as_border = true },
})
