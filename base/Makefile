table ?= tp.db

all: clean create

create:
	sqlite3 $(table) < creacion.sql

clean:
	rm -f $(table)

.PHONE: create clean
