return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        {
            'nvim-tree/nvim-web-devicons',
            enabled = vim.g.have_nerd_font
        },
    },
    config = function()
        local actions = require("telescope.actions")
        require('telescope').setup {
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-q>"] = function(prompt_bufnr)
                            actions.send_to_qflist(prompt_bufnr)
                            vim.cmd("Trouble qflist open")
                        end,
                    },
                    n = {
                        ["<C-q>"] = function(prompt_bufnr)
                            actions.send_to_qflist(prompt_bufnr)
                            vim.cmd("Trouble qflist open")
                        end,
                    },
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'

        vim.keymap.set('n', '<C-p>', builtin.git_files)
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fr', builtin.lsp_references)
        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)
        vim.keymap.set('n', '<leader>fS', builtin.lsp_dynamic_workspace_symbols)
        vim.keymap.set('n', '<leader>fw', builtin.grep_string)
        vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        vim.keymap.set('n', '<leader>fG', function()
            require('telescope.builtin').live_grep {
                additional_args = function()
                    return { '--case-sensitive' }
                end,
            }
        end)
    end,
}
