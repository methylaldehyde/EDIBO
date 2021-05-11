from flask import Flask, jsonify
import MySQLdb
app = Flask(__name__)
@app.route('/')
def index():
    return "<h1>Hello you!</h1>"
ufile = open('user.txt','r')
user = ufile.read()
ufile.close()
pfile = open('password.txt','r')
password = pfile.read()
pfile.close()
@app.route("/temp")
def temp():
    db = MySQLdb.connect("localhost", user, password, "world")
    cur = db.cursor()
    query = "SELECT * FROM world.artists WHERE pkArtistId=1"
    cur.execute(query)
    return jsonify(data=cur.fetchall())
if __name__ == '__main__':
    app.run(port=5000)

