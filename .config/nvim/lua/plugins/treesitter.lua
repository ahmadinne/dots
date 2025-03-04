return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "markdown_inline", "comment" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = false },
        })
    end
}
