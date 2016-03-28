BINS=cam cleanout makemovie tomatocam.ini

CRONS=campart cleanoutpart makemoviepart

bins:
	for i in $(BINS); do cp $$i /usr/local/bin; done
	for i in $(BINS); do chmod 755 /usr/local/bin/$$i; done
	for i in $(BINS); do chown root.root /usr/local/bin/$$i; done

crons:
	for i in $(CRONS); do cp $$i /etc/cron.d; done
	for i in $(CRONS); do chmod 755 /etc/cron.d/$$i; done
	for i in $(CRONS); do chown root.root /etc/cron.d/$$i; done

install: bins crons
	mkdir /tmp/pix
	chmod 777 /tmp/pix

uninstall:
	-for i in $(BINS); do rm /usr/local/bin/$$i; done
	-for i in $(CRONS); do rm /etc/cron.d/$$i; done

clean:
	find . -name \*~ -delete
