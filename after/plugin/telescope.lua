local builtin = require 'telescope.builtin';

Kmap("n", "<leader>s", ':Telescope live_grep<CR>')
Kmap("n", "<leader>ö", ':Telescope fd<CR>')
Kmap("n", "<leader>ä", builtin.git_files)
Kmap("n", "<leader>b", builtin.buffers)
Kmap("n", "<leader>?", builtin.keymaps)
Kmap("n", "<leader>m", builtin.marks)
Kmap("n", "<leader>p", builtin.commands)

-- This is your opts table
require("telescope").setup {
    pickers = {
        buffers = {
            sort_lastused = true,
            mappings = {
                i = {
                    ["<C-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    },
    defaults = {
        layout_strategy = "vertical",
        layout_config = { width = 0.95 },
        file_ignore_patterns = {
            "node_modules",
            "target",
            "dist"
        },
        mappings = {
            i = {
                ["<C-q>"] = require("telescope.actions").close,
                ["<C-n>"] = require("telescope.actions").cycle_history_next,
                ["<C-p>"] = require("telescope.actions").cycle_history_prev,
                ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
                ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
            },
        }
    }
}

require("telescope").load_extension("ui-select")
