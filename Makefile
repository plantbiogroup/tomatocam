BINS=cam cleanout makemovie tomatolabel tomatocam.ini diffimage

CRONS=campart cleanoutpart makemoviepart labelpart

bins:
	for i in $(BINS); do cp $$i /usr/local/bin; done
	for i in $(BINS); do chmod 755 /usr/local/bin/$$i; done
	for i in $(BINS); do chown root.root /usr/local/bin/$$i; done

crons:
	for i in $(CRONS); do cp $$i /etc/cron.d; done
	for i in $(CRONS); do chmod 755 /etc/cron.d/$$i; done
	for i in $(CRONS); do chown root.root /etc/cron.d/$$i; done

install: bins crons
	cp index.html /var/www/html/

uninstall:
	-for i in $(BINS); do rm /usr/local/bin/$$i; done
	-for i in $(CRONS); do rm /etc/cron.d/$$i; done

clean:
	find . -name \*~ -delete
