return {
    "folke/flash.nvim",
    config = function()
        require("flash").setup()
        vim.keymap.set("n", 's', function() require("flash").jump() end)
        vim.keymap.set('n', 'S', function() require("flash").treesitter() end)
        vim.keymap.set('n', 'f', function() require("flash").jump({ search = { forward = true, wrap = false, multi_window = false }, }) end)
        vim.keymap.set('n', 't', function() require("flash").jump({ search = { forward = false, wrap = false, multi_window = false }, }) end)
    end
}
