return {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },

        config = function()
            local lspconfig = require("lspconfig")

            for server, config in pairs(opts.servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            require("mason").setup()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers {
                function (server_name) -- default handler (optional)
                    lspconfig[server_name].setup {}
                end,

                ["rust_analyzer"] = function ()
                    require("rust-tools").setup {}
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
            }
        end,
    },
}

