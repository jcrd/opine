VERSIONCMD = git describe --dirty --tags --always 2> /dev/null
VERSION := $(shell $(VERSIONCMD) || cat VERSION)

PREFIX ?= /usr/local
BINPREFIX ?= $(PREFIX)/bin
MANPREFIX ?= $(PREFIX)/share/man

MANPAGE = opine.1

all: opine $(MANPAGE)

opine: opine.in
	sed -e "s/VERSION=/VERSION=$(VERSION)/" opine.in > opine
	chmod +x opine

$(MANPAGE): man/$(MANPAGE).pod
	pod2man -n=opine -c=opine -r=$(VERSION) $< $(MANPAGE)

install:
	mkdir -p $(DESTDIR)$(BINPREFIX)
	cp -p opine $(DESTDIR)$(BINPREFIX)
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	cp -p $(MANPAGE) $(DESTDIR)$(MANPREFIX)/man1

uninstall:
	rm -f $(DESTDIR)$(BINPREFIX)/opine
	rm -f $(DESTDIR)$(MANPREFIX)/man1/$(MANPAGE)

clean:
	rm -f opine $(MANPAGE)

.PHONY: all install uninstall clean
