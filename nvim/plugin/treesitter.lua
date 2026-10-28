vim.pack.add({
    "https://github.com/romus204/tree-sitter-manager.nvim",
})

local manager = require("tree-sitter-manager")
manager.setup({
    -- Options par défaut
    ensure_installed = {
        "bash",
        "dockerfile",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rst",
        "rust",
        "typescript",
        "vim",
        "yaml",
        "c",
        "ocaml",
    },                 -- la liste de tous les parsers à installer au démarrage de la session neovim. La valeur "all", installe tous les parsers.
    auto_install = true, -- installe les parsers manquant lors de l’édition d’un fichier
})
