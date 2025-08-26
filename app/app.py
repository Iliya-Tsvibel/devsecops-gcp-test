from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def root():
    return jsonify(status="ok", service="devsecops-demo")

@app.get("/healthz")
def healthz():
    return "ok", 200

@app.get("/info")
def info():
    return "Hello from Cloud Run!\nAPP_TOKEN=" + "demo-secret-value-please-rotate", 200
