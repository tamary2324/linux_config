vim.pack.add({ "hrsh7th/cmp-nvim-lsp",
    "antosha417/nvim-lsp-file-operations",
})

-- import cmp-nvim-lsp plugin
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})
