from flask_login import UserMixin
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import check_password_hash, generate_password_hash
from application.run import application

db = SQLAlchemy(application)


class Kunde(db.Model, UserMixin):
    __tablename__ = 'Kunde'
    id = db.Column('KundenNr', db.Integer, primary_key=True)
    email = db.column('Email', db.String(100))
    kundenname = db.column('Name', db.String(100))
    passwort = db.column('Passwort', db.String(100))

    def __init__(self, kundenname, email, passwort):

        self.kundenname = kundenname
        self.email = email
        self.passwort = generate_password_hash(passwort)

    def hash_check(self, password):

        return check_password_hash(self.passwort, password)