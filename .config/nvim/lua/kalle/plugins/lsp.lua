local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "gopls",
    "tsserver",
    "html",
    "cssls",
    "texlab",
})

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), --show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
    if client.name == "gopls" or client.name == "texlab" or client.name == "tsserver" or client.name == "cssls" then
        -- auto closing brackets and auto closing string
        vim.keymap.set("i", "(", "()<Left>")
        vim.keymap.set("i", "[", "[]<Left>")
        vim.keymap.set("i", "{", "{}<Left>")
        vim.keymap.set("i", '`', '``<Left>')
        vim.keymap.set("i", "{<CR>", "{<CR>}<Up><Esc>o")
        vim.keymap.set('i', ')', 'v:lua.check_bracket(")")', {expr=true})
        vim.keymap.set('i', '}', 'v:lua.check_bracket("}")', {expr=true})
        vim.keymap.set('i', ']', 'v:lua.check_bracket("]")', {expr=true})
        vim.keymap.set('i', '"', 'v:lua.check_quote("\\\"")', {expr=true})
        vim.keymap.set('i', '`', 'v:lua.check_quote("\\`")', {expr=true})

        function _G.check_bracket(bracket)
            local line = vim.api.nvim_get_current_line()
            local col = vim.fn.col('.')
            local char = string.sub(line, col, col)

            if char == bracket then
                return '<Right>'
            else
                return bracket
            end
        end

        function _G.check_quote(quote)
            local line = vim.api.nvim_get_current_line()
            local col = vim.fn.col('.')
            local char = string.sub(line, col, col)

            if char == quote then
                return '<Right>'
            else
                return quote .. quote .. "<Left>"
            end
        end

        -- function _G.check_dollar(dollar)
        --     local line = vim.api.nvim_get_current_line()
        --     local col = vim.fn.col('.')
        --     local char = string.sub(line, col, col)
        --
        --     if char == dollar then
        --         return '<Right>'
        --     else
        --         return dollar.. dollar.. "<Left>"
        --     end
        -- end


    end

    if client.name == "texlab" then
        vim.keymap.set("i", "$", "$$<Left>")
        vim.keymap.set('i', '$', 'v:lua.check_bracket("$")', {expr=true})
    end

end)

lsp.setup()
