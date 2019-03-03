"""
Author: Haolin Zhang
Date: 20-02-2019
"""

import mysql.connector as sql
import pandas as pd
import os
import csv

__location__ = 'path'
# Connect mysql function

def connectSql():
    conn = sql.connect(host = '127.0.0.1', user = 'root', password = "password", database = "books_studentID")
    return conn

def csv_divide(column_name):
    ori_file_path = os.path.join(__location__, 'Database of books.csv')
    out_file_path = os.path.join(__location__,'A2', column_name + '.csv')
    df = pd.read_csv(ori_file_path, encoding= 'ISO-8859-1')

    # a means append the data at the end of the file
    # newline = '' prevents the blank line at the end of the file
    out = open(out_file_path, 'a', newline= '')
    csv_write = csv.writer(out, dialect='excel')
    if column_name == 'Book':
        csv_write.writerow(['ISBN', column_name])
    else:
        csv_write.writerow(['ISBN', column_name, 'Rank'])

    if (column_name != 'Author'):
        for i in range(len(df)):
            ISBN = str(df['ISBN'][i])
            for j in range(len(str(df[column_name][i]).split(','))):
                # break when the string is none or blank spaces
                if str(df[column_name][i]).split(',')[j].isspace() or str(df[column_name][i]).split(',')[j] == '':
                    break
                else:
                    writing_list = list()
                    writing_list.append(ISBN)
                    # delete the blank space right or left to the words
                    writing_list.append(str(df[column_name][i]).split(',')[j].strip())
                    if column_name == 'Book':
                        csv_write.writerow(writing_list)
                    else:
                        writing_list.append(j + 1)
                        csv_write.writerow(writing_list)

    else:
        for i in range(len(df)):
            ISBN = str(df['ISBN'][i])
            for j in range(len(str(df[column_name][i]).split(' and '))):
                writing_list = list()
                writing_list.append(ISBN)
                # delete the blank space right or left to the words
                writing_list.append(str(df[column_name][i]).split(' and ')[j].strip())
                writing_list.append(j + 1)
                csv_write.writerow(writing_list)


    print(column_name, "Writing Done!")



# Insert values into Titles
def insertValues(topic):
    out_file_path = os.path.join(__location__, 'A2', topic + '.csv')

    conn = connectSql()
    cur = conn.cursor()
    try:
        cur.execute("load data local infile '%s' into table %s" % (out_file_path, topic))
        conn.commit()
    except Exception as e:
        print(e)
        print(topic, "Failed")

topics = ['Book', 'Author', 'Themes', 'Qualities']
for topic in topics:
    # csv_divide(topic)
    insertValues(topic)
