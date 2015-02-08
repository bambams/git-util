.PHONY: all help install uninstall

PREFIX=$(HOME)
BINDIR=$(PREFIX)/bin
UTILS=alog depends ps1__ push-backup release repo root size sync

all: help

help:
	@echo 'Try `make install'\'' to symlink utils into $(PREFIX).' 1>&2;
	@false;

install: $(BINDIR)
	@echo 'Installing into $(BINDIR)...';
	@for f in $(UTILS); do \
        echo "... git-$$f"; \
        ln -fs "$$(pwd)/git-$$f" "$</"; \
    done;

uninstall:
	@for f in $(UTILS); do \
        path="$(PREFIX)/bin/git-$$f"; \
        if [ -L "$$path" ]; then \
            echo "Removing $$path..."; \
            rm -f "$$path"; \
        else \
            echo "$$path doesn't exist..."; \
        fi; \
    done;

$(BINDIR):
	mkdir -p "$@";
