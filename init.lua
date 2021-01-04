vim.o.hidden = true
vim.o.confirm = true
vim.o.termguicolors = true
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.expandtab = false
vim.o.diffopt = "internal,filler,closeoff,vertical,algorithm:patience"
vim.o.showcmd = true
vim.o.cmdheight = 2
vim.o.scrolloff = 0
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.updatetime = 500
vim.o.selection = 'inclusive'
vim.o.hlsearch = false
vim.o.smartcase = true
vim.o.formatoptions = ""
vim.o.maxmempattern = 10000
vim.o.wildmenu = true
vim.o.wildmode = 'longest,full'
vim.o.fileencodings = 'utf-8,ucs-bom,gb2312,gbk,gb18030,latin1'
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorcolumn = false

vim.g.netrw_liststyle = 3

vim.o.t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"
vim.o.t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"

vim.cmd[[tnoremap <esc> <c-\><c-N>]]
vim.cmd[[tnoremap <c-w><c-w> <c-\><c-N><c-w><c-w>]]
vim.cmd[[tnoremap <c-w>h <c-\><c-N><c-w>h]]
vim.cmd[[tnoremap <c-w>j <c-\><c-N><c-w>j]]
vim.cmd[[tnoremap <c-w>k <c-\><c-N><c-w>k]]
vim.cmd[[tnoremap <c-w>l <c-\><c-N><c-w>l]]
vim.cmd[[nnoremap <silent> <leader>e :20Lexplore<cr>]]
vim.cmd[[nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>]]
vim.cmd[[nnoremap <silent> gD :lua vim.lsp.buf.implementation()<CR>]]
vim.cmd[[nnoremap <silent> gc :lua vim.lsp.buf.rename()<CR>]]
vim.cmd[[nnoremap <silent> gk :lua vim.lsp.buf.hover()<CR>]]
vim.cmd[[nnoremap <silent> gq :lua vim.lsp.buf.formatting()<cr>]]
vim.cmd[[nnoremap <silent> ]e :lua vim.lsp.diagnostic.goto_next()<cr>]]
vim.cmd[[nnoremap <silent> [e :lua vim.lsp.diagnostic.goto_prev()<cr>]]
vim.cmd"nnoremap <silent> [m :lua  require'ts_ext'.goto_context_start()<cr>"
vim.cmd"nnoremap <silent> ]m :lua  require'ts_ext'.goto_context_end()<cr>"
vim.cmd[[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "<Tab>"]]
vim.cmd[[inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"]]

vim.cmd[[nnoremap <silent> <leader><leader> :lua require("easy_search").files()<cr>]]
vim.cmd[[nnoremap <silent> <leader>b :lua require("easy_search").buf_list()<cr>]]
vim.cmd[[nnoremap <silent> <leader>r :lua require("easy_search").reference()<cr>]]
vim.cmd[[nnoremap <silent> <leader>g :lua require("easy_search").grep()<cr>]]
vim.cmd[[nnoremap <silent> <leader>t :lua require("easy_search").term_list()<cr>]]
vim.cmd[[nnoremap <silent> <leader>s :lua require("easy_search").symbols()<cr>]]
vim.cmd[[nnoremap <silent> <leader>f :lua require("easy_search").func()<cr>]]
vim.cmd[[nnoremap <silent> <leader>v :lua require("easy_search").vim_menu()<cr>]]
vim.cmd[[nnoremap <silent> <leader>z :lua require("easy_search").re_open()<cr>]]

vim.cmd[[autocmd Filetype rust,go,c,cpp,vim setlocal omnifunc=v:lua.vim.lsp.omnifunc]]
vim.cmd[[au FileType * lua require('ts_ext').on_filetype()]]

vim.api.nvim_exec([[
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]], {})

vim.cmd[[autocmd BufReadPost * lua goto_last_pos()]]
function goto_last_pos()
	local last_pos = vim.fn.line("'\"")
	if last_pos > 0 and last_pos <= vim.fn.line("$") then
		vim.api.nvim_win_set_cursor(0, {last_pos, 0})
	end
end

--if has('win32') || has('win64')
--	set guifont=:h20
--endif

--if &term =~# '^screen'
--    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
--    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
--endif

require'cossonleo.plugins'
require'stl'


--vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "<Tab>"]], {noremap = true, expr = true})
--vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {noremap = true, expr = true})
--vim.api.nvim_set_keymap("t", "<esc>", "<c-\\><c-N>", {noremap = true})
--vim.api.nvim_set_keymap("t", "<c-w><c-w>", "<c-\\><c-N><c-w><c-w>", {noremap = true})
--vim.api.nvim_set_keymap("t", "<c-w>h", "<c-\\><c-N><c-w>h", {noremap = true})
--vim.api.nvim_set_keymap("t", "<c-w>j", "<c-\\><c-N><c-w>j", {noremap = true})
--vim.api.nvim_set_keymap("t", "<c-w>k", "<c-\\><c-N><c-w>k", {noremap = true})
--vim.api.nvim_set_keymap("t", "<c-w>l", "<c-\\><c-N><c-w>l", {noremap = true})
--vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "gD", ":lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "gc", ":lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "gk", ":lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "gq", ":lua vim.lsp.buf.formatting()<cr>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<c-k>", ":lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})

