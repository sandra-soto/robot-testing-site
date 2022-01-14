from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")
@app.route("/error")
def error():
    return render_template("error.html")

@app.route("/welcome")
def welcome():
    return render_template("welcome.html")

@app.route("/example")
def example():
    return render_template("example.html")
    
if __name__ == "__main__":
    app.run(debug=True)