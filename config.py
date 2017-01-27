SQLALCHEMY_DATABASE_URI = 'sqlite3:///Datenbank.db'
SQLALCHEMY_TRACK_MODIFICATIONS = True

"""
Erstellung des Secretkey
>>> import os
>>> import binascii
>>> binascii.hexlify(os.urandom(24))
b'c851f31ebbf6524e640af9f7314626cf0bfffe8e2cee2954'

"""
SECRET_KEY = b'c851f31ebbf6524e640af9f7314626cf0bfffe8e2cee2954'
DEBUG = True