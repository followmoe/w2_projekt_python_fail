from flask import Flask



@app.route('/login')
def login():
    return 'Hello World!'

if __name__ == '__main__':
    app.run(host='192.168.33.10', port='9999')


@app.index('/login/index')

def index():
    return 'Erfolgreicher Login'