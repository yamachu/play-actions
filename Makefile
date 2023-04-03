diff-screenshot: PR=
diff-screenshot:
	for diff in $$(gh pr diff $(PR) --name-only); do \
		echo $$diff; \
	done;
