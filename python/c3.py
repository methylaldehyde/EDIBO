import MySQLdb
import make_response
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
cors = CORS(app, resources={r"/api/*": {"origins": "*"}})


@app.after_request
def after_request(response):
    response.headers.add('Access-Control_Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST.DELETE')
    return response

@app.route('/')
def index():
    return "<h1>Hello you!</h1>"

ufile = open('user.txt', 'r')
user = ufile.read()
ufile.close()
pfile = open('password.txt', 'r')
password = pfile.read()
pfile.close()

@app.route("/select")
def select():
    db = MySQLdb.connect("localhost", user, password, "world")
    cur = db.cursor()
    query = "SELECT * FROM world.artists WHERE pkArtistId=1"
    cur.execute(query)
    json_data = cur.fetchall()
    print("json_data (select):")
    print(json_data)
    return jsonify(data=json_data)

def sniffy(response):
    pass

@app.route("/get_invoices")
def get_invoices():
    db = MySQLdb.connect("localhost", user, password, "world")
    cur = db.cursor()
    proc = "get_invoices_by_empl_no_arg"
    cur.callproc(proc, [])
    json_data = cur.fetchall()
    print("json_data (proc):")
    print(json_data)
    response = {'message': 'OK', 'data': json_data}
    #return make_response(jsonify(response), 200)
    return jsonify(response)


if __name__ == '__main__':
    app.run(port=5000)
