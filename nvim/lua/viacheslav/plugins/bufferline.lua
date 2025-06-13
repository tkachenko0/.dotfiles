return {
    'willothy/nvim-cokeline',
    -- enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('cokeline').setup({
            show_if_buffers_are_at_least = 2,
        })
        local map = vim.keymap.set
        map('n', '<A-Left>', '<Plug>(cokeline-focus-prev)', { desc = 'Previous buffer' })
        map('n', '<A-Right>', '<Plug>(cokeline-focus-next)', { desc = 'Next buffer' })
    end,
}
