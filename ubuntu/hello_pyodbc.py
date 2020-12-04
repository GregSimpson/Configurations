# "Proof connection at pyodbc level."
# # Test pyodbc connection. Result is 42.
# # Note parameters in connection string, <PARAMETER>.

# import pyodbc


# conn = pyodbc.connect('DRIVER=FreeTDS;SERVER=<IP_OR_HOSTNAME>;PORT=1433;DATABASE=<DATABASE_NAME>;UID=<USERNAME>;PWD=<PASSWORD>;TDS_Version=8.0;')
# cursor = conn.cursor()
# for row in cursor.execute('select 6 * 7 as [Result];'):
    # print (row.Result)


# https://docs.microsoft.com/en-us/sql/connect/python/pyodbc/step-3-proof-of-concept-connecting-to-sql-using-pyodbc?view=sql-server-ver15


import pyodbc 
# Some other example server values are
# server = 'localhost\sqlexpress' # for a named instance
# server = 'myserver,port' # to specify an alternate port
server = 'tcp:myserver.database.windows.net' 
database = 'mydb' 
username = 'myusername' 
password = 'mypassword' 
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()

