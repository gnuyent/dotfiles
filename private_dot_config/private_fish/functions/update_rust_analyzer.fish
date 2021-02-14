function rust_analyzer_check_update
	if not type -q rg
		echo "ripgrep is not installed. Not installing rust-analyzer."
		return 1
	end
	set latest_version (curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest | grep -o -P -m 1 '(?<=<code>).*(?=</code>)')
	if type -q rust-analyzer
		set local_version (rust-analyzer --version | grep -o --pcre2 '(?<= )(.*)')
		set text "Updat"
	else
		set local_version ""
		set text "Install"
	end

	if test $latest_version = $local_version
		echo "Latest version of rust-analyzer ($local_version) is up to date."
	else
		echo $text"ing rust-analyzer..."
		mkdir -p ~/.local/bin/
		curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o ~/.local/bin/rust-analyzer
		chmod +x ~/.local/bin/rust-analyzer
		if test $text = "Install"
			echo "Installed rust-analyzer ($latest_version)!"
		else
			echo "Updated rust-analyzer from $local_version to $latest_version!"
		end
	end

	set -e local_version
	set -e latest_version
	set -e text
end
