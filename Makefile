# senf

.POSIX:
.SUFFIXES:

VERSION=0.1.0
SENF=senf
PACKAGE=senf-$(VERSION)

# variables
EMACSFLAGS=--batch -Q

# paths
srcdir=.

prefix=/usr/local
exec_prefix=$(prefix)
bindir=$(exec_prefix)/bin
libdir=$(exec_prefix)/lib
libexecdir=$(exec_prefix)/libexec/$(SENF)
lispdir=$(exec_prefix)/lisp/$(SENF)

datarootdir=$(prefix)/share
datadir=$(datarootdir)/$(SENF)
docdir=$(datarootdir)/doc/$(SENF)
infodir=$(datarootdir)/info

# programs
INSTALL=/usr/bin/install
INSTALL_DATA=$(INSTALL) -m 644
LS=/usr/local/bin/gls
MAKEINFO=/usr/local/bin/makeinfo
EMACS=/usr/local/bin/emacs

.PHONY:
clean:

.PHONY:
distclean: clean
	-rm $(PACKAGE).tar.gz

.PHONY:
dist: distclean
	-rm -rf $(PACKAGE)
	mkdir -p $(PACKAGE)
	cp -R $(shell $(LS) --ignore$(PACKAGE)) $(PACKAGE)
	tar czf $(PACKAGE).tar.gz $(PACKAGE)
	-rm -rf $(PACKAGE)

.PHONY:
install: installdirs
	$(INSTALL) senf $(DESTDIR)$(bindir)
	$(INSTALL_DATA) README.txt $(DESTDIR)$(docdir)

.PHONY:
uninstall:
	-rm $(DESTDIR)$(bindir)/senf
	-rm -rf $(DESTDIR)$(docdir)

.PHONY:
installdirs:
	mkdir -p $(DESTDIR)$(docdir)
	mkdir -p $(DESTDIR)$(bindir)

README.txt: doc/README.org
	-rm $@
	$(EMACS) $< $(EMACSFLAGS) -l $(realpath doc/org-export.el) -f org-ascii-export-to-ascii
