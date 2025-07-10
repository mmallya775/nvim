-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Show diagnostics for the current line in a floating window with <leader>d
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

vim.diagnostic.config({
	virtual_text = {
		enabled = true,
		source = "if_many",
		-- prefix = "▶",
		prefix = function(diagnostic)
			local icons = {
				[vim.diagnostic.severity.ERROR] = "󰅚", -- Error circle with X
				[vim.diagnostic.severity.WARN] = "󰀪", -- Warning triangle
				[vim.diagnostic.severity.INFO] = "󰋽", -- Info circle
				[vim.diagnostic.severity.HINT] = "󰌶", -- Lightbulb
			}
			return icons[diagnostic.severity] or "󰅙"
		end,
		spacing = 4,
	},
})

--vim.keymap.set('n', '<leader>dt', function()
--  vim.diagnostic.config({
--    virtual_text = not vim.diagnostic.config().virtual_text,
--  })
--end, { desc = 'Toggle diagnostic virtual text' })
-- Toggle function that preserves the configuration
vim.keymap.set("n", "<leader>dt", function()
	local current_config = vim.diagnostic.config()

	if current_config.virtual_text then
		-- Disable virtual text
		vim.diagnostic.config({
			virtual_text = false,
		})
	else
		-- Re-enable with full configuration
		vim.diagnostic.config({
			virtual_text = {
				enabled = true,
				source = "if_many",
				-- prefix = "▶",
				prefix = function(diagnostic)
					local icons = {
						[vim.diagnostic.severity.ERROR] = "󰅚", -- Error circle with X
						[vim.diagnostic.severity.WARN] = "󰀪", -- Warning triangle
						[vim.diagnostic.severity.INFO] = "󰋽", -- Info circle
						[vim.diagnostic.severity.HINT] = "󰌶", -- Lightbulb
					}
					return icons[diagnostic.severity] or "󰅙"
				end,
				spacing = 4,
			},
		})
	end
end, { desc = "Toggle diagnostic virtual text" })

-- When *any* LSP client attaches to a buffer…
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- Only continue if this client supports CodeLens
		if client and client.server_capabilities.codeLensProvider then
			-- First refresh as soon as the client is ready
			vim.lsp.codelens.refresh()

			-- Then keep lenses up to date while you work in that *same* buffer
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "CursorHold", "InsertLeave" }, {
				buffer = args.buf, -- buffer‑local: won’t affect other files
				callback = function()
					vim.lsp.codelens.refresh()
				end,
			})
		end
	end,
})

