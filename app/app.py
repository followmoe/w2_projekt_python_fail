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


@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run(host='192.168.33.10', port='9999')

