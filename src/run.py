from flask import Flask
from flask_login import LoginManager


def create_app():
    application=Flask(__name__)

    application.config.from_pyfile('config.py')
    return application

application=create_app()
login_manager = LoginManager()
login_manager.init_app(application)


@application.route('/')
def login():
    return 'Hello World!'


if __name__ == '__main__':
    application.run(host='192.168.33.10', port=9999)




