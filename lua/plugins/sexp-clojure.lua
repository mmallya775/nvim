return {
  {
    "guns/vim-sexp",
    ft = { "clojure", "fennel", "scheme", "lisp" },
    dependencies = {
      "tpope/vim-repeat",
      "tpope/vim-surround",
    },
  },
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    ft = { "clojure", "fennel", "scheme", "lisp" },
    dependencies = "guns/vim-sexp",
  },
}
