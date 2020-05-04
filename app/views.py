from app import app
from flask import request, render_template
from sqlalchemy import create_engine, text
import os

@app.route('/')
def search():
    query = request.args.get('q', default='', type=str)

    # pagination
    page = max(1, request.args.get('page', default=1, type=int))
    per_page = 20
    offset = (page - 1) * per_page
    recalls = []

    if (query):
        engine = create_engine(os.environ['DATABASE_URL'])
        sql = text("SELECT * FROM recall r WHERE r.make ILIKE :query OR r.model ILIKE :query OFFSET :offset LIMIT :per_page")
        recalls = engine.execute(sql, query=query, per_page=per_page, offset=offset).fetchall()

    return render_template('search.html', query=query, recalls=recalls)
