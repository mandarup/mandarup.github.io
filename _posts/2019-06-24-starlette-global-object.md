# Storing globally accessible objects in a session scope and across sessions in Starlette

[Reference](https://github.com/encode/starlette/issues/374)


In Flask this can be done using the `g` object:
```python
from flask import g

def get_db():
    if 'db' not in g:
        g.db = connect_to_database()

    return g.db

@app.teardown_appcontext
def teardown_db():
    db = g.pop('db', None)

    if db is not None:
        db.close()
```

In Starlette this can be done using requests object like:

```python
# For stuff that has a request/response lifespan, you can store arbitrary stuff on the request "scope". 
request["foo"] = whatever().

# For lifespan, use globals, with 
@app.on_event('startup') 
@app.on_event('shutdown') 
# to setup and teardown any network connections or other resources.
```

This answer was provided by Tom Christie, author of Starlette on 2/1/2019.
