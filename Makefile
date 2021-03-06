SCRIPT= pma.py
EXEC= pma

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

install:
	mkdir -p $(PREFIX)/bin
	cp -f $(SCRIPT) $(PREFIX)/bin/$(EXEC)
	chmod 755 $(PREFIX)/bin/$(EXEC)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(EXEC)

reinstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(EXEC)
	mkdir -p $(PREFIX)/bin
	cp -f $(SCRIPT) $(PREFIX)/bin/$(EXEC)
	chmod 755 $(PREFIX)/bin/$(EXEC)

.PHONY: install uninstall
