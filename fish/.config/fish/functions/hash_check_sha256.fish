function hash_check_sha256 -d "Compare a given SHA256 hash to a file's local SHA256 hash."
	echo "$argv[1] $argv[2]" | sha256sum --check
end
