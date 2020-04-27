from app import app
from flask import request, render_template
from sqlalchemy import create_engine, text

@app.route('/')
def search():
    query = request.args.get('q')
    # engine = create_engine('db://...')
    # sql = text("SELECT * FROM recall r WHERE r.body LILE :query LIMIT 0, 20");
    # recalls = engine.execute(sql, query='%' + query + '%');
    recalls = [{
        'name': 'Recall 1',
        'year': 2020
    }];

    return render_template('search.html', query=query, recalls=recalls)
