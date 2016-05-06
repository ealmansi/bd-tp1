#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
import sqlite3
import sys

def getArguments(argumentNames):
    parser = argparse.ArgumentParser(prog=sys.argv[0])
    for argumentName in argumentNames:
        parser.add_argument('--{argumentName}'.format(argumentName=argumentName), required=True)
    return vars(parser.parse_args(sys.argv[1:]))

def runQuery(queryTemplateFilepath, arguments):
    with open(queryTemplateFilepath) as queryTemplateFile:
        queryTemplate = queryTemplateFile.read()
        with sqlite3.connect("tp.db") as connection:
            cursor = connection.cursor()
            cursor.execute(queryTemplate, arguments)
            for columnName in [description[0] for description in cursor.description]:
                print columnName, "|",
            print
            for row in cursor.fetchall():
                for value in row:
                    print value or "NULL", "|",
                print

def runStatement(statementTemplateFilepath, arguments):
    with open(statementTemplateFilepath) as statementTemplateFile:
        statementTemplate = statementTemplateFile.read()
        with sqlite3.connect("tp.db") as connection:
            cursor = connection.cursor()
            cursor.execute(statementTemplate, arguments)
            connection.commit()
            print "Success."
