import os

from cs50 import SQL
from flask import Flask, flash, jsonify, redirect, render_template, request, session

# Configure application
app = Flask(__name__)

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] = True

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///messages.db")

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":

        message = request.form.get("message")
        db.execute("INSERT INTO texts (message) VALUES(?)", message)

        return redirect("/")

    else:

        notes = db.execute("SELECT * FROM texts")
        return render_template("index.html", notes=notes)