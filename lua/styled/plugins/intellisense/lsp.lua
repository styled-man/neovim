local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    print("Could not locate `cmp_nvim_lsp` plugin!")
end

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    local keymaps = {
        { "gf",         "<cmd>Lspsaga lsp_finder<CR>" },               -- show definition, references
        { "gD",         "<Cmd>lua vim.lsp.buf.declaration()<CR>" },    -- got to declaration
        { "gd",         "<cmd>Lspsaga peek_definition<CR>" },          -- see definition and make edits in window
        { "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>" }, -- go to implementation
        { "<leader>ca", "<cmd>Lspsaga code_action<CR>" },              -- see available code actions
        { "<leader>rn", "<cmd>Lspsaga rename<CR>" },                   -- smart rename
        { "<leader>d",  "<cmd>Lspsaga show_line_diagnostics<CR>" },    -- show  diagnostics for line
        { "<C-.>",  "<cmd>Lspsaga show_cursor_diagnostics<CR>" },  -- show diagnostics for cursor
        { "[d",         "<cmd>Lspsaga diagnostic_jump_prev<CR>" },     -- jump to previous diagnostic in buffer
        { "]d",         "<cmd>Lspsaga diagnostic_jump_next<CR>" },     -- jump to next diagnostic in buffer
        { "K",          "<cmd>Lspsaga hover_doc<CR>" },                -- show documentation for what is under cursor
        { "<leader>o",  "<cmd>LSoutlineToggle<CR>" },                  -- see outline on right hand side
    }

    if client.name == "tsserver" then
        table.insert(keymaps.normal.entries, { "<leader>rf", ":TypescriptRenameFile<CR>" })      -- rename file and update imports
        table.insert(keymaps.normal.entries, { "<leader>oi", ":TypescriptOrganizeImports<CR>" }) -- organize imports
        table.insert(keymaps.normal.entries, { "<leader>ru", ":TypescriptRemoveUnused<CR>" })    -- remove unused variables
    end

    for _, mapping in pairs(keymaps) do
        vim.keymap.set("n", mapping[1], mapping[2], opts)
    end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

return {
    on_attach = on_attach,
    capabilities = capabilities,
}
