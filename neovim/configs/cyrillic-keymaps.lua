-- Function to set keymaps
local map = vim.api.nvim_set_keymap

-- Options for keymaps
local opts = { noremap = true, silent = true }

-- Ukrainian Keyboard Mappings
-- Mapping Ukrainian characters to English key functions

-- Top row (Й, Ц, У, К, Е, Н, Г, Ш, Щ, З, Х, Ї)
map("n", "й", "q", opts) -- Map 'й' to 'q'
map("n", "ц", "w", opts) -- Map 'ц' to 'w'
map("n", "у", "e", opts) -- Map 'у' to 'e'
map("n", "к", "r", opts) -- Map 'к' to 'r'
map("n", "е", "t", opts) -- Map 'е' to 't'
map("n", "н", "y", opts) -- Map 'н' to 'y'
map("n", "г", "u", opts) -- Map 'г' to 'u'
map("n", "ш", "i", opts) -- Map 'ш' to 'i'
map("n", "щ", "o", opts) -- Map 'щ' to 'o'
map("n", "з", "p", opts) -- Map 'з' to 'p'
map("n", "х", "[", opts) -- Map 'х' to '['
map("n", "ї", "]", opts) -- Map 'ї' to ']'

-- Middle row (Ф, І, В, А, П, Р, О, Л, Д, Ж, Є)
map("n", "ф", "a", opts) -- Map 'ф' to 'a'
map("n", "і", "s", opts) -- Map 'і' to 's'
map("n", "в", "d", opts) -- Map 'в' to 'd'
map("n", "а", "f", opts) -- Map 'а' to 'f'
map("n", "п", "g", opts) -- Map 'п' to 'g'
map("n", "р", "h", opts) -- Map 'р' to 'h'
map("n", "о", "j", opts) -- Map 'о' to 'j'
map("n", "л", "k", opts) -- Map 'л' to 'k'
map("n", "д", "l", opts) -- Map 'д' to 'l'
map("n", "ж", ";", opts) -- Map 'ж' to ';'
map("n", "є", "'", opts) -- Map 'є' to '\''

-- Bottom row (Я, Ч, С, М, И, Т, Ь, Б, Ю)
map("n", "я", "z", opts) -- Map 'я' to 'z'
map("n", "ч", "x", opts) -- Map 'ч' to 'x'
map("n", "с", "c", opts) -- Map 'с' to 'c'
map("n", "м", "v", opts) -- Map 'м' to 'v'
map("n", "и", "b", opts) -- Map 'и' to 'b'
map("n", "т", "n", opts) -- Map 'т' to 'n'
map("n", "ь", "m", opts) -- Map 'ь' to 'm'
map("n", "б", ",", opts) -- Map 'б' to ','
map("n", "ю", ".", opts) -- Map 'ю' to '.'

-- Additional characters and symbols
map("n", "ё", "`", opts) -- Map 'ё' to '`'
map("n", ".", "/", opts) -- Map '.' to '/'
map("n", ",", "m", opts) -- Map ',' to 'm'

-- Shifted characters for visual and other modes if necessary
map("v", "Й", "Q", opts)
map("v", "Ц", "W", opts)
map("v", "У", "E", opts)
map("v", "К", "R", opts)
map("v", "Е", "T", opts)
map("v", "Н", "Y", opts)
map("v", "Г", "U", opts)
map("v", "Ш", "I", opts)
map("v", "Щ", "O", opts)
map("v", "З", "P", opts)
map("v", "Х", "{", opts)
map("v", "Ї", "}", opts)

map("v", "Ф", "A", opts)
map("v", "І", "S", opts)
map("v", "В", "D", opts)
map("v", "А", "F", opts)
map("v", "П", "G", opts)
map("v", "Р", "H", opts)
map("v", "О", "J", opts)
map("v", "Л", "K", opts)
map("v", "Д", "L", opts)
map("v", "Ж", ":", opts)
map("v", "Є", '"', opts)

map("v", "Я", "Z", opts)
map("v", "Ч", "X", opts)
map("v", "С", "C", opts)
map("v", "М", "V", opts)
map("v", "И", "B", opts)
map("v", "Т", "N", opts)
map("v", "Ь", "M", opts)
map("v", "Б", "<", opts)
map("v", "Ю", ">", opts)

-- Optional: You can map more specific actions for insert mode or command-line mode if needed
map("i", "й", "q", opts)
map("i", "ц", "w", opts)
-- Add more mappings for insert mode as needed

-- Command-line mode mappings
-- This can be useful for command-line operations if required
map("c", "й", "q", opts)
map("c", "ц", "w", opts)
-- Add more mappings for command-line mode if necessary
