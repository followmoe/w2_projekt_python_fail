from flask import Flask
from application.src.database import Kunde
#from flask_login import LoginManager
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import InputRequired, length, EqualTo, Email
from flask import flash, redirect, url_for, session, render_template


application=Flask(__name__)
application.config.from_pyfile('config.py')

#login_manager = LoginManager()
#login_manager.init_app(application)


@application.route('/index')
def index(name=None):
    return render_template('index.html', name=name)

@application.route('/')
def login():
    return render_template('login.html')



@application.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        flash(u'Successfully logged in as %s' % form.user.username)
        session['user_id'] = form.user.id
        return redirect(url_for('index'))
    return render_template('login.html', form=form)


class LoginForm(FlaskForm):
    Kundenname = StringField('Username', validators=[InputRequired(), length(1, 80)])
    passwort = PasswordField('Password', validators=[InputRequired()])

    def validate(self):
        if not FlaskForm.validate(self):
            return False

        nutzer = Kunde.query.filter_by(Kundenname=self.Kundenname.data).first()
        if nutzer is None:
            self.Kundenname.errors.append("Benutzername nicht bekannt")
            return False

        if not nutzer.verify_password(self.passwort.data):
            self.passwort.errors.append("Passwort stimmt nicht")
            return False

        self.user = nutzer
        return True


if __name__ == '__main__':
    application.run(host='192.168.33.10', port=9999)




