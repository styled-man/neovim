vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymaps = {
    all = {
        mode = "",
        opts = { noremap = true, silent = true },
        entries = {
            -- leader key
            { "<Space>", "<Nop>" }
        }
    },
    normal = {
        mode = "n",
        opts = { noremap = true, silent = true },
        entries = {
            -- Better window navigation
            { "<C-h>",     "<C-w>h" },
            { "<C-j>",     "<C-w>j" },
            { "<C-k>",     "<C-w>k" },
            { "<C-l>",     "<C-w>l" },

            { "<leader>e", ":NeoTreeRevealToggle<CR>" },
            { "<leader>u", ":UndotreeToggle<CR>" },

            -- Resize with arrows
            { "<C-Up>",    ":resize +2<CR>" },
            { "<C-Down>",  ":resize -2<CR>" },
            { "<C-Left>",  ":vertical resize -2<CR>" },
            { "<C-Right>", ":vertical resize +2<CR>" },

            -- Navigate buffers
            { "<S-l>",     ":bnext<CR>" },
            { "<S-h>",     ":bprevious<CR>" },
            { "<C-w>",     ":lua MiniBufremove.delete()<CR>" },

            -- Stop highlighting after search
            { "<Esc>",     ":noh<CR>" },

            -- Move text up and down
            { "<A-j>",     ":m .+1<CR>" },
            { "<A-k>",     ":m .-2<CR>" },

            -- format and save
            { "<C-s>",     ":lua vim.lsp.buf.format()<CR>:w<CR>", },
            -- formatting
            { "<A-S-f>",   ":lua vim.lsp.buf.format()<CR>" },
        }
    },
    insert = {
        mode = "i",
        opts = { noremap = true, silent = true },
        entries = {
            -- Press jj fast to enter
            { "jj", "<ESC>" },
        }
    },
    visual = {
        mode = "v",
        opts = { noremap = true, silent = true },
        entries = {
            -- Stay in indent mode
            { "<",     "<gv" },
            { ">",     ">gv" },

            -- Move text up and down
            { "<A-j>", ":m .+1<CR>" },
            { "<A-k>", ":m .-2<CR>" },
            { "p",     '"_dP' },
        }
    },
    visual_block = {
        mode = "x",
        opts = { noremap = true, silent = true },
        entries = {
            -- Move text up and down
            { "J",     ":move '>+1<CR>gv-gv" },
            { "K",     ":move '<-2<CR>gv-gv" },
            { "<A-j>", ":move '>+1<CR>gv-gv" },
            { "<A-k>", ":move '<-2<CR>gv-gv" },
        }
    },
    terminal = {
        mode = "t",
        opts = { silent = true },
        entries = {
            -- Better terminal navigation
            { "<C-h>", "<C-\\><C-N><C-w>h" },
            { "<C-j>", "<C-\\><C-N><C-w>j" },
            { "<C-k>", "<C-\\><C-N><C-w>k" },
            { "<C-l>", "<C-\\><C-N><C-w>l" },
        }
    }

}

for _, mapping in pairs(keymaps) do
    for _, entry in pairs(mapping.entries) do
        vim.api.nvim_set_keymap(mapping.mode, entry[1], entry[2], mapping.opts)
    end
end
