local comment_status, comment = pcall(require, "mini.comment")
if not comment_status then
    print("Could not locate `mini.comment` plugin!")
    return
end

comment.setup({
    options = {
        ignore_blank_line = true,
        custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
    }
})
