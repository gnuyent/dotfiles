-- Bootstrap Packer
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
	vim.cmd("packadd packer.nvim")
end

-- Bootstrap Hotpot
local hotpot_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/hotpot.nvim"
if vim.fn.empty(vim.fn.glob(hotpot_path)) > 0 then
	print("Could not find hotpot.nvim, cloning new copy to", hotpot_path)
	vim.fn.system({ "git", "clone", "https://github.com/rktjmp/hotpot.nvim", hotpot_path })
end

-- Bootstrap .fnl support
require("hotpot")

require("init")
require("fenneled_init")
