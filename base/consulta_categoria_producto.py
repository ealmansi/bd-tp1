#!/usr/bin/env python
# -*- coding: utf-8 -*-

from queries import *

if __name__ == '__main__':
    queryTemplate = "consulta_categoria_producto.template.sql" 
    arguments = getArguments(["categoria"])
    runQuery(queryTemplate, arguments)
