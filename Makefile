%.raw: %.url
	curl "$(shell cat $<)" > $@

waymark.html: waymark.raw slidy.awk
	awk -f slidy.awk $< > $@
	open -a Firefox $@ || git diff $@

.PHONY: clean pull regenerate

clean:
	rm -f waymark.raw

pull:
	- git pull --rebase

regenerate: clean pull waymark.html