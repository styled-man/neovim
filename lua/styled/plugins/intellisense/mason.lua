local mason_status, mason = pcall(require, "mason")
if not mason_status then
    print("Could not locate `mason` plugin!")
    return
end

local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
    print("Could not locate `mason-lspconfig` plugin!")
    return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local servers = {
    "lua_ls",
    "tsserver",
    "pyright",
    "cssls",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "html",
    "jsonls",
    "jdtls",
    "tailwindcss",
    "yamlls",
}

local opts = require(Nvim_user .. ".plugins.intellisense.lsp")

mason.setup()
mason_lsp.setup({ ensure_installed = servers })

for _, server in pairs(servers) do
    local require_ok, conf_opts = pcall(require, Nvim_user .. ".plugins.intellisense.server_config." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end

-- typescript requires super special setup
local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
    print("Could not locate `typescript` plugin!")
end

typescript.setup({
    server = opts,
})
