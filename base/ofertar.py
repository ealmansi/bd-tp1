import sqlite3
import sys

if __name__ == '__main__':
    bd = sys.argv[1]
    params = {'idUsuario': sys.argv[2], 'idSubasta': sys.argv[3], 'precio': int(sys.argv[4])}

    con = sqlite3.connect(bd)
    con.execute('INSERT INTO ofertaUsuarioSubasta VALUES (:idUsuario, :idSubasta, NOW(), :precio) VALUES', params)
    con.commit()
