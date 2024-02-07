from flask import Flask, request, jsonify
from functools import wraps

app = Flask(__name__)

def check_auth(username, password):
    return username == 'test' and password == 'abcABC123'

def authenticate():
    message = {'message': "Authentication failed."}
    resp = jsonify(message)
    resp.status_code = 401
    resp.headers['WWW-Authenticate'] = 'Basic realm="Login Required"'
    return resp

def requires_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        auth = request.authorization
        if not auth or not check_auth(auth.username, auth.password):
            return authenticate()
        return f(*args, **kwargs)
    return decorated

@app.route('/api/users', methods=['POST'])
@requires_auth
def get_users():
    # Your logic to get the list of users
    # Example response:
    users = {"0": "root", "1": "daemon", "2": "bin", ...}
    return jsonify(users)

if __name__ == '__main__':
    app.run(host='localhost', port=3000)

