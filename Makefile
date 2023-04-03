diff-screenshot:
	for diff in $$(git diff HEAD master --name-only); do \
		echo $$diff
	done;
