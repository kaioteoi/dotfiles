return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'j-hui/fidget.nvim',
        'nvimtools/none-ls.nvim',
        'nvim-lua/plenary.nvim',
    },

    config = function()
        local cmp = require 'cmp'
        local cmp_lsp = require 'cmp_nvim_lsp'
        local capabilities = vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())
        local null_ls = require 'null-ls'
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

        -- Format on write: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
        null_ls.setup {
            -- you can reuse a shared lspconfig on_attach callback here
            on_attach = function(client, bufnr)
                if client.supports_method 'textDocument/formatting' then
                    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format { async = false }
                        end,
                    })
                end
            end,

            -- List of builtins: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettier,
            },
        }

        require('fidget').setup {}
        require('mason').setup()
        require('mason-lspconfig').setup {
            ensure_installed = {
                'lua_ls',
                'rust_analyzer',
                -- "gopls",
                'clojure_lsp',
                'pylsp',
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                    }
                end,

                ['lua_ls'] = function()
                    local lspconfig = require 'lspconfig'
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = 'Lua 5.1' },
                                diagnostics = {
                                    globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
                                },
                            },
                        },
                    }
                end,
            },
        }

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<C-Space>'] = cmp.mapping.complete(),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            }),
        }

        vim.diagnostic.config {
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
        }
    end,
}
