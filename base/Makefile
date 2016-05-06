table ?= tp.db

all: clean create

tp.db: create

create:
	sqlite3 $(table) < creacion.sql

fill:
	sqlite3 $(table) < llenado.sql

run: create
	for query in query*.sql; do \
		sqlite3 $(table) < $$query; \
	done

query1 query2 query3 query4 query5:
	sqlite3 $(table) $*

clean:
	rm -f $(table)

.PHONE: create clean run
