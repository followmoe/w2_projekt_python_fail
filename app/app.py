
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World!'


@app.route('/biba_bastard')
def biba():
    return 'Biba kann nix, die alte Fotze!!!!'

if __name__ == '__main__':
    app.run(host='192.168.33.10', port='9999')
