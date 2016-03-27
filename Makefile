BINS=cam cleanout makemovie tomatocam.ini

CRONS=/etc/cron.d/campart \
	/etc/cron.d/cleanoutpart \
	/etc/cron.d/makemoviepart


bins:
	sudo for i in $(BINS) do; cp $$i /usr/local/bin; done
	sudo for i in $(BINS) do; chmod 755 /usr/local/bin/$$i; done
	sudo for i in $(BINS) do; chown root.root /usr/local/bin$$i; done

crons:
	sudo for i in $(CRONS) do; cp $$i /etc/cron.d; done
	sudo for i in $(CRONS) do; chmod 755 /etc/cron.d/$$i; done
	sudo for i in $(CRONS) do; chown root.root /etc/cron.d/$$i; done

install: bins crons

uninstall:
	-sudo for i in $(BINS) do; rm /usr/local/bin/$$i; done
	-sudo for i in $(CRONS) do; rm /etc/cron.d/$$i; done

clean:
	find . -name \*~ -delete
