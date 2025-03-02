
require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            ".cache",
            ".local",
            ".android",
            ".rustup",
            ".cargo",
            ".pki",
            "node_modules"
        },
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close,
                ["<C-u>"] = false,
                ["<C-d>"] = require("telescope.actions").delete_buffer + require("telescope.actions").move_to_top,
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
                ["<C-h>"] = require("telescope.actions.layout").cycle_layout_prev,
                ["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
            },
            n = {
                ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            }
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    },
})

require("filenav").setup({
    prev_file_key = "<S-h>",
    next_file_key = "<S-l>",
    max_history   = 100,
    remove_duplicates = true,
})
