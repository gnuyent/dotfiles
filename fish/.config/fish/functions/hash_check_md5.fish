function hash_check_md5 -d "Compare a given md5 hash to a file's local md5 hash."
	echo "$argv[1] $argv[2]" | md5sum --check
end
