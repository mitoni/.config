return {
    {
        "APZelos/blamer.nvim",
        event = "BufRead",
        config = function()
            vim.g.blamer_enabled = true
            vim.g.blamer_show_in_visual_modes = 0
            vim.g.blamer_template = '<committer>, <committer-time> • <commit-short>'
        end
    }
}
