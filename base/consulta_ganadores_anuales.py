#!/usr/bin/env python
# -*- coding: utf-8 -*-

from queries import *

if __name__ == '__main__':
    queryTemplate = "consulta_ganadores_anuales.template.sql" 
    arguments = getArguments(['año'])
    runQuery(queryTemplate, arguments)
