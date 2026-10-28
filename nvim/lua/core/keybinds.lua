-- on défini la toouche espacee comme maitresse --
vim.g.mapleader = " "


-- Raccourci pour la fonction set
local map = vim.keymap.set

-- copy paste --
map("", "<leader>y", "+y", { desc = "Yank to clipboard" }) -- E.g: <leader>yy will yank current line to os clipboard
map("", "<leader>Y", "+y$", { desc = "Yank until EOL to clipboard" })

map("n", "<leader>p", "+p", { desc = "Paste after cursor from clipboard" })
map("n", "<leader>P", "+P", { desc = "Paste before cursor from clipboard" })



-- on utilise ;; pour sortir du monde insertion
map("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })

-- terminal management
map("n", "<leader>t", ":terminal", { desc = "open a terminal" })
map("t", "<ESC>", "<C-\\><C-n>", { desc = "sortir du mode insertion dans le terminal" })

-- Changement de fenêtre avec Ctrl + déplacement uniquement au lieu de Ctrl-w + déplacement
map("n", "<C-h>", "<C-w>h", { desc = "Déplace le curseur dans la fenêtre de gauche" })
map("n", "<C-j>", "<C-w>j", { desc = "Déplace le curseur dans la fenêtre du bas" })
map("n", "<C-k>", "<C-w>k", { desc = "Déplace le curseur dans la fenêtre du haut" })
map("n", "<C-l>", "<C-w>l", { desc = "Déplace le curseur dans la fenêtre droite" })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- I déplace le texte sélectionné en mode visual (activé avec v)
map("v", "<A-j>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
map("v", "<A-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })
map("x", "<A-j>", ":move '<-2<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" })
map("x", "<A-k>", ":move '>+1<CR>gv-gv", { desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" })

-- Navigation entre les buffers
map("n", "<A-l>", ":bnext<CR>", opts)
map("n", "<A-h>", ":bprevious<CR>", opts)
