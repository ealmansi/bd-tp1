import sqlite3
import sys

if __name__ == '__main__':
    bd = sys.argv[1]
    params = {'idUsuario': sys.argv[2], 'idPublicacion': sys.argv[3], 'monto': int(sys.argv[4])}

    con = sqlite3.connect(bd)
    con.execute('INSERT INTO hizoOferta VALUES (:idUsuario, :idPublicacion, NOW(), :monto) VALUES', params)
    con.commit()
