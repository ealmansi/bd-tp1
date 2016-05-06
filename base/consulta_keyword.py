#!/usr/bin/env python
# -*- coding: utf-8 -*-

from queries import *

if __name__ == '__main__':
    queryTemplate = "consulta_keyword.template.sql" 
    arguments = getArguments(["patron", "categoria"])
    runQuery(queryTemplate, arguments)
