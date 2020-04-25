from app import app
from flask import request, render_template, url_for

@app.route('/')
def search():
    return render_template('search.html')
