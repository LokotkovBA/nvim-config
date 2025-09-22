local function fix_all(opts)
    opts = opts or {}

    local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
    vim.validate("bufnr", bufnr, "number")

    local client = opts.client or vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })[1]

    if not client then return end

    local request

    if opts.sync then
        request = function(buf, method, params) client:request_sync(method, params, nil, buf) end
    else
        request = function(buf, method, params) client:request(method, params, nil, buf) end
    end

    request(bufnr, "workspace/executeCommand", {
        command = "eslint.applyAllFixes",
        arguments = {
            {
                uri = vim.uri_from_bufnr(bufnr),
                version = vim.lsp.util.buf_versions[bufnr],
            },
        },
    })
end

vim.lsp.config('eslint', {
    on_init = function(client)
        vim.api.nvim_create_user_command("EslintFixAll", function() fix_all({ client = client, sync = true }) end, {})
    end,
    on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

local on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ async = false })
        end
    })
end

vim.lsp.config('lua_ls', {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        }
    }
})

vim.lsp.config('rust_analyzer', {
    on_attach = on_attach,
    cmd = {
        "rustup", "run", "stable", "rust-analyzer"
    },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            }
        }
    }
})

local vue_ts_plugin_path = "/Users/borislokotkov/.nvm/versions/node/v22.18.0/lib/node_modules/@vue/typescript-plugin"

vim.lsp.config('ts_ls', {
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_ts_plugin_path, -- Adjust this path as necessary
                languages = { "vue" }
            }
        }
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

vim.lsp.config('volar', {})

vim.lsp.config('tailwindcss', {
    settings = {
        tailwindCSS = {
            classAttributes = {
                "class",
                "className",
                "classNames",
                ".+ClassName"
            },
        },
    },
})

--
-- local function patch(result)
--     if not vim.tbl_islist(result) or type(result) ~= "table" then
--         return result
--     end
--
--     return { result[1] }
-- end
--
-- local function handle_gtd(err, result, ctx, ...)
--     vim.lsp.handlers['textDocument/definition'](err, patch(result), ctx, ...)
-- end
