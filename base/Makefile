table ?= tp.db

all: clean create

create:
	sqlite3 $(table) < creacion.sql
fill:
	sqlite3 $(table) < llenado.sql
run: create
	sqlite3 $(table) < queries.sql

clean:
	rm -f $(table)

.PHONE: create clean run
