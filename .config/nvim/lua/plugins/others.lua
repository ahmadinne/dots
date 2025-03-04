return {
    { "lambdalisue/vim-suda" },
    { "windwp/nvim-autopairs" },
    { "brenoprata10/nvim-highlight-colors" },
    {
        "echasnovski/mini.nvim",
        config = function()
            require("nvim-highlight-colors").setup()
            require("nvim-autopairs").setup()
            require("mini.statusline").setup()
            require("mini.splitjoin").setup()
            require("mini.surround").setup()
            require("mini.tabline").setup()
            require("mini.comment").setup()
        end
    },
}
