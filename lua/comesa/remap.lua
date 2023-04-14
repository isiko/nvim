vim.g.mapleader = " "

local opts = { remap = true, silent = true }

--- Wrappers around [vim.keymap.set]
---@param mode string|table
---@param map string|table
---@param thing string|function
---@param options table|nil
function Kmap(mode, map, thing, options)
    local o = options or opts

    if type(map) == "table" then
        for item in pairs(map) do
            vim.keymap.set(mode, item, thing, o)
        end
    end

    if type(map) == "string" then
        vim.keymap.set(mode, map, thing, o)
    end
end

-- go into normal mode with jj
Kmap("i", "jj", "<Esc>", opts)

-- open netrw
Kmap("n", "<leader>pv", vim.cmd.Ex, opts)

-- save file
Kmap("n", "<leader>w", ":w<CR>", opts)

-- move lines
Kmap("v", "J", ":m '>+1<CR>gv=gv", opts)
Kmap("v", "K", ":m '<-2<CR>gv=gv", opts)
Kmap("v", "<TAB>", ">gv", opts)
Kmap("v", "<S-TAB>", "<gv", opts)

Kmap("i", "<A-j>", "<Down>", opts)
Kmap("i", "<A-k>", "<Up>", opts)
Kmap("i", "<A-h>", "<Left>", opts)
Kmap("i", "<A-l>", "<Right>", opts)

-- Open Alpha
Kmap("n", "°", ":Alpha<CR>")

-- buffer keys
Kmap("n", "bd", "<cmd>bd<CR>", opts)
Kmap("n", "bp", "<cmd>bp<CR>", opts)
Kmap("n", "bn", "<cmd>bn<CR>", opts)

-- open undotree (maybe move into after-directory
Kmap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", opts)

-- open note-taking buffer
Kmap("n", "<leader>ß",
    ":noswapfile enew<CR>:setlocal buftype=nofile<CR>:setlocal bufhidden=hide<CR>file scratch<CR>", opts)

-- Toggle trouble
Kmap("n", "<leader>ü", ":TroubleToggle<CR>", opts);

-- [GIT] Fugitive
-- Status
Kmap("n", "<leader>gs", "<cmd>Git<CR>")
Kmap("n", "<leader>gl", "<cmd>Git log<CR>")

-- Commits
-- | Kmap("n", "<leader>ga", "<cmd>Git add .<CR>", {desc = "[g]it add ."})
-- | Kmap("n", "<leader>gc", "<cmd>Git commit<CR>", {desc = "[g]it commit"})
-- | Kmap("n", "<leader>gca", "<cmd>Git commit --amend<CR>", {desc = "[g]it commit --amend"})
-- | Kmap("n", "<leader>gp", "<cmd>Git push<CR>", {desc = "[g]it push"})
-- | Kmap("n", "<leader>gpf", "<cmd>Git push --force<CR>", {desc = "[g]it push --force"})
-- | Kmap("n", "<leader>gd", "<cmd>Git diff<CR>", {desc = "[g]it diff"})

-- [NVIM-TREE]
Kmap("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", {desc = "toggle [t]ree"})
Kmap("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", {desc = "refresh [t]ree"})
