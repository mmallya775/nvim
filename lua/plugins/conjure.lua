return {
	"Olical/conjure",

	config = function()
		vim.g["conjure#mapping#doc_word"] = false
		-- Make the conjure raw output true so that the pprint or print to console outputs
		-- are printed like they were returns. Easier to read
		vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true

	end,
}
