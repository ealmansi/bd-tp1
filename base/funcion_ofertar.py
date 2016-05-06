#!/usr/bin/env python
# -*- coding: utf-8 -*-

from queries import *

if __name__ == '__main__':
    statementTemplate = "funcion_ofertar.template.sql" 
    arguments = getArguments(["idUsuario", "idPublicacion", "monto"])
    runStatement(statementTemplate, arguments)
