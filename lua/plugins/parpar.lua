return {
    "julienvincent/nvim-paredit",
    ft = { "clojure", "scheme", "lisp", "fennel" },
    opts = {
        keys = {
            ["<leader>sb"] = { function() require("nvim-paredit").api.slurp_backwards() end, "Slurp backwards" },
            ["<leader>bb"] = { function() require("nvim-paredit").api.barf_backwards() end, "Barf backwards" },
            ["<leader>sf"] = { function() require("nvim-paredit").api.barf_forwards() end, "Barf forwards" },
            ["<leader>bf"] = { function() require("nvim-paredit").api.slurp_forwards() end, "Slurp forwards" },
        },
    },
}
