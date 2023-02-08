local actions = require 'telescope.actions'
local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local sorters = require 'telescope.sorters'

local action_state = require 'telescope.actions.state'
--require 'nvim-web-devicons'.setup({
--    color_icons = false,
--    default = true
--})

-- [Settings]
local themeName = 'no-clown-fiesta'
local disable_background = true

local themes = {}
local function SetTheme(color)
    if color == nil then return false end

    color = color or 'rose-pine'
    vim.cmd.colorscheme(color)

    vim.cmd.hi("Normal guibg=NONE cterm=NONE")
    vim.cmd.hi("NormalFloat guibg=NONE cterm=NONE")
    vim.cmd.hi("SignColumn guibg=NONE")
    vim.cmd.hi("GitGutterAdd guibg=transparent")
    vim.cmd.hi("GitGutterDelete guibg=transparent")
    vim.cmd.hi("GitGutterChange guibg=transparent")
end

local themes = {
    ['rosé-pine'] = function()
        require('rose-pine').setup({ disable_background = disable_background })
        SetTheme('rose-pine')
    end,
    ['no-clown-fiesta'] = function()
        require("no-clown-fiesta").setup({
            transparent = disable_background, -- Enable this to disable the bg color
            styles = {
                comments = {},
                keywords = {},
                functions = {},
                variables = {},
                type = { bold = true },
            },
        })
        SetTheme('no-clown-fiesta')
    end
}

local mini = {
    layout_strategies = "vertical",
    layout_config = {
        height = 10,
        width = 0.3,
        prompt_position = "top"
    },
    sorting_strategy = "ascending",
}

local function ThemeNames()
    local names = {}
    local count = 1
    for k, _ in pairs(themes) do
        names[count] = k
        count = count + 1
    end
    return names
end

local opts = {
    finder = finders.new_table(ThemeNames()),
    sorter = sorters.get_generic_fuzzy_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
        map("i", "<CR>", function()
            local selected = action_state.get_selected_entry()
            themes[selected[1]]()
            actions.close(prompt_bufnr)
        end)
        return true
    end
}

local colors = pickers.new(mini, opts)

function SetColor()
    colors:find()
end

themes[themeName]()

vim.api.nvim_create_user_command('Color', SetColor, { nargs = 0 })
