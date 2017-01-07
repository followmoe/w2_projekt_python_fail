import os
import sqlite3

#imports für
from flask import Flask, request, session, g, redirect, url_for, abort, \
                render_template, flash

app = Flask(__name__) # erstell die app-instanz
app.config.from_object(__name__) #ladet die konfig von einer umgebungsvariable

app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'Datenbank.sql')
))

# festlegen der umgebungsvariable
app.config.from_envvar('APP_SETTINGS', silent=True)

#methode zur verbindung der Datenbank.

def connect_db():
    #Verbindung zur Datenbank
    rv = sqlite3.connect(app.config['DATABASE'])
    #Aufruf der sqlite3.row funktion dies erlaubt es das die Zeilen der Datenbank als Dictionaries
    #anstatt als Tupel verwendet werden.
    rv.row_factory = sqlite3.Row
    return rv


@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run(host='192.168.33.10', port='9999')

