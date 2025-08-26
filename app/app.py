from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.get("/")
def root():
    return jsonify(status="ok", service="devsecops-demo")

@app.get("/info")
def info():
    token = os.getenv("APP_TOKEN", "not-set")
    return f"Hello from Cloud Run!\nAPP_TOKEN={token}\n", 200


@app.get("/health")
def health():
    return "ok", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8080")))
