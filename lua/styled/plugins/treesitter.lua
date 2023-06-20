local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_status then
    print("Could not locate `treesitter` plugin!")
    return
end

treesitter.setup({ 
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
    context_commentstring = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "c",
        "make",
        "html",
        "css",
        "javascript",
        "tsx",
        "typescript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "yaml",
        "dockerfile",
    },
})
