return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "Kero-sine",
                    path = "~/personal/notes/Kero-sine/",
                },
                {
                    name = "ava",
                    path = "~/personal/notes/ava/ava",
                },
            },
            completion = {
                default = true,
                nvim_cmp = true,
                min_chars = 1,
            },
        })
        vim.keymap.set("n", "<C-]>", function()
            if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end, { noremap = false, expr = true })
        vim.keymap.set("v", "<leader>l", function()
            if require("obsidian").util then
                return "<cmd>ObsidianLink<CR>"
            else
                return "<leader>l"
            end
        end, {noremap = false, expr = true})
    end,
}
