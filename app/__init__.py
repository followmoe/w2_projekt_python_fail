from flask import Flask
from flask_login import LoginManager


def create_app():
    app=Flask(__name__)

    app.config.from_pyfile('config.py')
    return app


app=create_app()
login_manager = LoginManager()
login_manager.init_app(app)


from app.routes import *
from app.config import *
from app.database import *