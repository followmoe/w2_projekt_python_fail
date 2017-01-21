from flask import Flask
from flask_login import LoginManager


def create_app():
    application=Flask(__name__)

    application.config.from_pyfile('config.py')
    return app

app=create_app()
login_manager = LoginManager()
login_manager.init_app(app)

from app.app.src.