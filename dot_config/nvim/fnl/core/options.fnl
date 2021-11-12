(import-macros {:opt-set se- :def-autocmd au- :def-augroup gr-} :zest.macros)

(local cmd vim.api.nvim_command)

; Automatically write buffers when not focused
(se- autowrite true)

; Case insensitive on search
(se- ignorecase true)
; Unless there is a capital in the search
(se- smartcase true)
; Line numbers
(se- number true)
; Relative line numbers
(se- relativenumber true)
; Enable line wrapping
(se- wrap true)
; Hide text mode since statusline does it already
(se- showmode false)
; Enable mouse mode
(se- mouse :a)
; set encoding to UTF-8
(se- encoding :UTF-8)
; TextEdit might fail if hidden is not set
(se- hidden true)
; 100 ms, less delays and better UX
(se- updatetime 100)
; Vertical split to the right
(se- splitright true)
; Horizontal split to the bottom
(se- splitbelow true)

; Highlight on yank
(gr- :yank-highlight (au- :TextYankPost ["*" :silent!]
                          "lua vim.highlight.on_yank()"))

; Filetype plugins
(cmd "filetype plugin indent on")

; Automatically run `chezmoi apply` on dotfile save
(au- :BufWritePost "~/.local/share/chezmoi/*" "! chezmoi apply --source-path %")

