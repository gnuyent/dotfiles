(import-macros {:def-keymap map} :zest.macros)

; Leader keys
(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")
(map :<BS> [n :silent] :<C-^>)
; Window Navigation
(each [_ k (ipairs [:h :j :k :l])]
  (map (.. :<C- k ">") [n :silent] (.. :<C-w> k)))

; Automatically resize windows
(map "=" [n] :<C-w>=)
; Word wrap bindings - easily navigate long lines
(vim.api.nvim_set_keymap :n :k "v:count == 0 ? 'gk' : 'k'"
                         {:noremap true :expr true :silent true})

(vim.api.nvim_set_keymap :n :j "v:count == 0 ? 'gj' : 'j'"
                         {:noremap true :expr true :silent true})

; Quick exit terminal (in term mode)
(map "<C-[>" [t] "<C-\\><C-n>")

