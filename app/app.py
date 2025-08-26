from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.get("/")
def root():
    # Lightweight root check
    return jsonify(status="ok", service="devsecops-demo")

@app.get("/healthz")
def healthz():
    # Used by smoke checks and probes
    return "ok", 200

@app.get("/info")
def info():
    # Shows token for smoke check
    token = os.getenv("APP_TOKEN", "not-set")
    return f"Hello from Cloud Run!\nAPP_TOKEN={token}", 200

if __name__ == "__main__":
    # Cloud Run injects PORT; default to 8080 for local runs
    port = int(os.getenv("PORT", "8080"))
    app.run(host="0.0.0.0", port=port)
