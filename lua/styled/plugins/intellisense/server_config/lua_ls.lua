return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "Nvim_user" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
        },
    },
}
