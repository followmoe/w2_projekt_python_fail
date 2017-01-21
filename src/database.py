from application.src.run import application
from flask_login import UserMixin
from werkzeug.security import check_password_hash, generate_password_hash
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy(application)


class Kunde(db.Model, UserMixin):
    __tablename__ = 'Kunde'
    id = db.Column('KundenNr', db.Integer, primary_key=True)
    email = db.column('Email', db.String(100), unique=True)
    kundenname = db.column('Name', db.String(100), unique=True)
    passwort = db.column('Passwort', db.String(100), unique=True)

    def __init__(self, kundenname, email, passwort):

        self.kundenname = kundenname
        self.email = email
        self.passwort = generate_password_hash(passwort)

    def hash_check(self, password):

        return check_password_hash(self.passwort, password)