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
        sql = """ SELECT r.id, r.body, m.name model, k.name make, r.updated_at
                       FROM recall r, make k, model m
                       WHERE r.model_id = m.id
                       AND m.make_id = k.id
                       AND (
                         r.body ILIKE :query OR
                         m.name ILIKE :query OR
                         k.name ILIKE :query )
                       OFFSET :offset
                       LIMIT :per_page"""
        recalls = engine.execute(text(sql), query='%'+query+'%', per_page=per_page, offset=offset).fetchall()

    return render_template('search.html', query=query, recalls=recalls)

# todo: add security
@app.route('/admin/recall', methods=["POST", "GET"])
def admin_recall():
    engine = create_engine(os.environ['DATABASE_URL'])

    # models for the dropdown
    sql = """ SELECT m.id, m.name, k.name make
                   FROM model m, make k
                   WHERE m.make_id = k.id
                   ORDER BY k.name, m.name"""
    models = engine.execute(text(sql)).fetchall()

    # post data
    model_id = request.form.get('model', default=0, type=int)
    body = request.form.get('body', default='', type=str)
    result = False

    if (model_id > 0):
        try:
            sql = text("INSERT INTO recall (body, model_id) VALUES (:body, :model_id)")
            result = engine.execute(sql, body=body, model_id=model_id)
        except:
            result = False

    return render_template('admin/recall.html', result=result, models=models)
