---@type ChadrcConfig 
local M = {}
M.ui = {theme = 'everforest'}
M.mappings = require("custom.mappings")
M.plugins = "custom.plugins"

--jump to the line focused when last exit happen
local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{callback = function()
			local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
			if {row, col} ~= {0, 0} then
				vim.api.nvim_win_set_cursor(0, {row, 0})
			end
		end,
	group = group
	}
)

--9 lines keep below
vim.o.scrolloff = 9
-- set tabstop=4
-- set softtabstop=4
-- set shiftwidth=4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4


vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"

return M
