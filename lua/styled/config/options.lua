local options = {
    -- show line numbers
    number = true,

    -- indentation
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    autoindent = true,
    smartindent = true,
    showtabline = 2,

    -- line wrapping
    wrap = true,

    -- search settings
    ignorecase = true,
    smartcase = true,

    -- appearance
    termguicolors = true,
    background = "dark",

    -- backspace
    backspace = "indent,eol,start",

    -- use clipboard across the entire system
    clipboard = "unnamedplus",

    -- split view
    splitbelow = true,
    splitright = true,

    -- search
    hlsearch = false,
    incsearch = true,

    -- miscallenous
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    scrolloff = 8,
    showmode = false, -- hide which mode your in on the bottom
    timeoutlen = 250,
}


for key, value in pairs(options) do
    vim.opt[key] = value
end

vim.opt.iskeyword:append "-"
