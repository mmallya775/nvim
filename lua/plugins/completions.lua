return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Updated to use new vim.lsp.config API (Neovim 0.11+)
			vim.lsp.config("clojure_lsp", {
				capabilities = capabilities,
				lens = {
					enable = false, -- Disable all CodeLens from clojure_lsp
				},
				on_attach = function(client, bufnr)
					if client.server_capabilities.codeLensProvider then
						-- Clear existing autocommands for this buffer
						-- vim.api.nvim_clear_autocmds({ group = "lsp_codelens", buffer = bufnr })
						--
						-- -- Create the group (only once)
						-- local group = vim.api.nvim_create_augroup("lsp_codelens", { clear = false })

						vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
							buffer = bufnr,
							callback = vim.lsp.codelens.refresh,
						})
					end
				end,
			})

			-- Configure hover handler with dark border
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()
			local kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			}
			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						--vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

						-- For `mini.snippets` users:
						-- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
						-- insert({ body = args.body }) -- Insert at cursor
						-- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
						-- require("cmp.config").set_onetime({ sources = {} })
					end,
				},
				-- completion = {
				--   autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
				--   documentation = {
				--     enabled = true,
				--   },
				-- },
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
						entry_filter = function(entry)
						  local kind = entry:get_kind()
						  return kind ~= require("cmp").lsp.CompletionItemKind.Text
						end,
					},
					{ name = "omni" },
					--	{ name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {

					{
						name = "buffer",
					},
				}),

				sorting = {
					priority_weight = 2,
					comparators = {
						-- Prioritize by kind (Variable > Function > others)
						function(entry1, entry2)
							local kind_order = {
								Variable = 1,
								Function = 2,
								Method = 2,
								Field = 3,
								Property = 3,
								Class = 4,
								Keyword = 5,
								Snippet = 6,
								Text = 7,
							}

							local kind1 = kind_order[entry1:get_kind() and require("cmp.types").lsp.CompletionItemKind[entry1:get_kind()] or ""]
								or 100
							local kind2 = kind_order[entry2:get_kind() and require("cmp.types").lsp.CompletionItemKind[entry2:get_kind()] or ""]
								or 100

							if kind1 ~= kind2 then
								return kind1 < kind2
							end
						end,

						-- Default comparators (preserve fallback behavior)
						require("cmp.config.compare").offset,
						require("cmp.config.compare").exact,
						require("cmp.config.compare").score,
						require("cmp.config.compare").recently_used,
						require("cmp.config.compare").locality,
						require("cmp.config.compare").kind,
						require("cmp.config.compare").length,
						require("cmp.config.compare").order,
					},
				},

				formatting = {
					format = function(entry, vim_item)
						--     -- Get the icon for the current kind
						local icon = kind_icons[vim_item.kind] or ""

						-- Prepend the icon to the abbreviation (the main completion text)
						-- Add a space after the icon for better readability
						vim_item.abbr = string.format("%s %s", icon, vim_item.abbr)

						-- You can choose to keep the 'kind' as well if you want it duplicated,
						-- or you can make it an empty string if the icon alone is enough.
						-- If you want to completely remove the 'kind' text from its original column,
						-- you can set vim_item.kind = "".
						-- For now, let's keep it as is, so you have both the icon in abbr and the kind in its column.
						-- If you don't want the kind column at all, you might need to adjust cmp sources or formatting options.

						-- (Optional: if you want the original kind text removed from its column after moving the icon)
						-- vim_item.kind = ""

						-- Set the menu source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							path = "[Path]",
							nvim_lua = "[Lua]",
						})[entry.source.name]

						return vim_item
					end,
				},
			})
		end,
	},
}