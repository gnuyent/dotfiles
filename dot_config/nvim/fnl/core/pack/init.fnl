(import-macros {: pack!} :core.macros)

;;; Essential
;; Plugin Manager
(pack! :wbthomason/packer.nvim)
;; Fennel Configuration
(pack! :rktjmp/hotpot.nvim)

;;; Aesthetic
;; Icons
(pack! :kyazdani42/nvim-web-devicons)
;; Colorscheme
(pack! :projekt0n/github-nvim-theme {:as :colorscheme :req :theme})

;; Statusline
(pack! :nvim-lualine/lualine.nvim {:req :lualine})

