local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
	print("Could not locate `null-ls` plugin!")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		diagnostics.eslint_d.with({
			-- js/ts linter
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
			end,
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = autogroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = autogroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						---@diagnostic disable-next-line: redefined-local
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
	automatic_installation = true,
})
