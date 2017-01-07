from setuptools import setup

#setup Funktion zum installieren der App
setup(

    name='app',
    packages=['app'],
    include_package_data=True,
    install_requires=[
        'flask',
    ],


)