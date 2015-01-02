.PHONY: all install

PREFIX=$(HOME)

all:

install:
	eval ln -fs `pwd`/git-* '$(PREFIX)/bin/';
