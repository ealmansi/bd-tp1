#!/usr/bin/env python
# -*- coding: utf-8 -*-

from queries import *

if __name__ == '__main__':
    queryTemplate = "consulta_usuario.template.sql" 
    arguments = getArguments(["idUsuario"])
    runQuery(queryTemplate, arguments)
