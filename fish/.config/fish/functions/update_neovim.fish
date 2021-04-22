function update_neovim
	if not type -q rg
		echo "ripgrep is not installed. Not installing neovim nightly."
		return 1
	end
	set latest_version (curl -sL https://github.com/neovim/neovim/releases/nightly | rg -o -P -m 1 '(?<=-dev\+....-)(\w+)$')
	if type -q nvim
		set local_version (nvim --version | rg -o --pcre2 '(?<=-dev\+....-)(\w*)')
		set text "Updat"
	else
		set local_version ""
		set text "Install"
	end

	if test $latest_version = $local_version
		echo "Latest version of neovim ($local_version) is up to date."
	else
		echo $text"ing neovim..."
		mkdir -p ~/.local/bin/
		curl -sL https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o ~/.local/bin/nvim
		chmod u+x ~/.local/bin/nvim
		if test $text = "Install"
			echo "Installed neovim ($latest_version)!"
		else
			echo "Updated neovim! ($local_version -> $latest_version)"
		end
	end

	set -e local_version
	set -e latest_version
	set -e text
end
