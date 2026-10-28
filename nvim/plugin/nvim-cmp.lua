vim.pack.add({
    { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") }, -- moteur de snippets
    "https://github.com/saadparwaiz1/cmp_luasnip",                                       -- ajoute LuaSnip à l’autocompletion
    "https://github.com/rafamadriz/friendly-snippets",                                   -- collection de snippets pratiques
    "https://github.com/onsails/lspkind.nvim",                                           -- vs-code pictogrammes
    "https://github.com/hrsh7th/cmp-cmdline",                                            -- source pour les completions de la cmdline de vim
    "https://github.com/hrsh7th/cmp-path",                                               -- source pour compléter les chemins des fichiers
    "https://github.com/hrsh7th/cmp-buffer",                                             -- source pour compléter le texte déjà présent dans le buffer
    "https://github.com/hrsh7th/nvim-cmp",
})

local cmp = require("cmp")

local luasnip = require("luasnip")

local lspkind = require("lspkind")

local mappings = {
    ["<A-k>"] = cmp.mapping.select_prev_item(),
    ["<A-j>"] = cmp.mapping.select_next_item(),
    ["<A-b>"] = cmp.mapping.scroll_docs(-1),
    ["<A-f>"] = cmp.mapping.scroll_docs(1),
    ["<A-Space>"] = cmp.mapping.complete(),
    ["<A-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accepte la sélection courante. Mettre à `false` pour ne confirmer que les items explicitement sélectionnés
}
-- chargement des snippets (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    completion = {
        completeopt = "menu,menuone,preview,noselect",
    },
    snippet = { -- on utilise luasnip comme moteur de snippets
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = mappings,

    -- sources pour l’autocompletion
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "nvim_lua" },
        { name = "luasnip" },  -- snippets
        { name = "buffer" },   -- texte du buffer courant
        { name = "path" },     -- chemins dy système de fichier
    }),

    formatting = {
        -- Comportement par défaut
        expandable_indicator = true,
        -- Champs affichés par défaut
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
            mode = "symbol_text",
            -- On suffixe chaque entrée par son type
            menu = {
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                path = "[Path]",
            },
        }),
    },
})

-- `/` complétion
cmp.setup.cmdline("/", {
    -- mapping = cmp.mapping.preset.cmdline(),
    mapping = mappings,
    sources = {
        { name = "buffer" },
    },
})

-- `:` complétion
cmp.setup.cmdline(":", {
    -- mapping = cmp.mapping.preset.cmdline(),
    mapping = mappings,
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" },
            },
        },
    }),
})
