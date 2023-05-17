---@type ChadrcConfig 
local M = {}
M.ui = {theme = 'aquarium'}
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

return M
