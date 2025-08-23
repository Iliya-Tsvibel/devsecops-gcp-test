from flask import Flask, jsonify
app = Flask(__name__)
@app.get("/")
def root():
    return jsonify(status="ok", service="devsecops-demo")
@app.get("/healthz")
def health():
    return "ok", 200
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
