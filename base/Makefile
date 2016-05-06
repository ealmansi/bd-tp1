table ?= tp.db

all: clean create

tp.db: create

create:
	sqlite3 $(table) < creacion.sql

fill:
	sqlite3 $(table) < llenado.sql

query1 query2 query3 query4 query5:
	sqlite3 $(table) < $@.sql

run: query1 query2 query4 query5

clean:
	rm -f $(table)

.PHONE: create clean run
