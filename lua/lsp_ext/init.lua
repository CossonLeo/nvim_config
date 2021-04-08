
local M = {}

require('vim.lsp.log').set_level("error")
require('lsp_ext.server')

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover, {
		border = "single" 
	}
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
	vim.lsp.handlers.signature_help, {
		border = "single"
	}
)
   

vim.cmd[[nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>]]
vim.cmd[[nnoremap <silent> gD :lua vim.lsp.buf.implementation()<CR>]]
vim.cmd[[nnoremap <silent> gr :lua vim.lsp.buf.rename()<CR>]]
vim.cmd[[nnoremap <silent> gk :lua vim.lsp.buf.hover({border = 'single'})<CR>]]
vim.cmd[[nnoremap <silent> gq :lua vim.lsp.buf.formatting()<cr>]]
vim.cmd[[nnoremap <silent> gf :lua vim.lsp.buf.code_action()<cr>]]
vim.cmd[[nnoremap <silent> ]e :lua vim.lsp.diagnostic.goto_next()<cr>]]
vim.cmd[[nnoremap <silent> [e :lua vim.lsp.diagnostic.goto_prev()<cr>]]

vim.cmd[[autocmd Filetype rust,go,c,cpp,vim setlocal omnifunc=v:lua.vim.lsp.omnifunc]]

vim.cmd "hi link LspError ErrorMsg"
vim.cmd "hi link LspWarning WarningMsg"

function M.statusline()
	if vim.fn.mode() == "n" then
		return require('lsp_ext.statusline').lsp_info():sub(1,40)
	end
	return ""
end

return M
