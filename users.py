from flask import Flask, request, jsonify

app = Flask(__name__)

# Define the username and password
USERNAME = 'test'
PASSWORD = 'abcABC123'

# Dummy data for users and groups (you may need to import additional libraries to get real system data)
USERS = {
    "0": "root",
    "1": "daemon",
    "2": "bin",
    # Add more users here
}

GROUPS = {
    "0": "root",
    "1": "daemon",
    "2": "bin",
    # Add more groups here
}

@app.route('/api/users', methods=['POST'])
def get_users():
    auth = request.authorization
    if not auth or not (auth.username == USERNAME and auth.password == PASSWORD):
        return jsonify({'error': 'Unauthorized access'}), 401

    return jsonify(USERS)

@app.route('/api/groups', methods=['POST'])
def get_groups():
    auth = request.authorization
    if not auth or not (auth.username == USERNAME and auth.password == PASSWORD):
        return jsonify({'error': 'Unauthorized access'}), 401

    return jsonify(GROUPS)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)

