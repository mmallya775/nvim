return {
  "Olical/conjure",

  config = function()
    vim.g["conjure#mapping#doc_word"] = false
    -- Make the conjure raw output true so that the pprint or print to console outputs
    -- are printed like they were returns. Easier to read
    vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
    --  vim.g["g:conjure#client#sql#stdio#command"] = "psql postgresql://postgres:password@localhost:5432/swbo-db"
    --
--    vim.g["conjure#client#sql#stdio#command"] = {
--      "env",
--      "PGPASSWORD=password",
--      "psql",
--      "-U",
--      "postgres",
--      "-d",
--      "swbo-db",
--      "-h",
--      "localhost",
--      "-p",
--      "5432",
--    }
  end,
}
