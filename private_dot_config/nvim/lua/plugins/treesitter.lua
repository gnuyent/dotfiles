local ts_cfg = require("nvim-treesitter.configs")

ts_cfg.setup {
    ensure_installed = "maintained",
    highlight = {
	enable = true,
	use_languagetree = true,
    },
    indent = {
	enable = true,
    }
}

