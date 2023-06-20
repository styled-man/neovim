local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
    print("Could not locate `bufferline` plugin!")
    return
end

local bufremove_status, bufremove = pcall(require, "mini.bufremove")
if not bufremove_status then
    print("Could not locate `mini.bufremove` plugin!")
    return
end

bufremove.setup({})

local dark_color = "#161823"
local primary_color = "#25283a"


bufferline.setup({
    options = {
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        close_command = function(n) bufremove.delete(n, false) end,
        right_mouse_command = function(n) bufremove.delete(n, false) end,
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            },
            {
                filetype = "undotree",
                text = "Undo tree",
                text_align = "center",
                separator = true,
            }
        },
    },
    highlights = {
        fill = {
            bg = dark_color,
        },
        background = {
            bg = dark_color,
        },
        close_button = {
            fg = dark_color,
            bg = dark_color,
        },
        close_button_visible = {
            bg = primary_color,
        },
        modified = {
            bg = dark_color,
        },
        separator = {
            bg = dark_color,
            fg = dark_color,
        },
        separator_visible = {
            bg = primary_color,
            fg = dark_color,
        },
        separator_selected = {
            bg = primary_color,
            fg = dark_color,
        },
        offset_separator = {
            fg = dark_color,
        },
        buffer_selected = {
            bold = false,
            italic = false,
        },
        hint_visible = {
            bg = dark_color,
        },
        hint = {
            bg = dark_color,
        },
    }
})
