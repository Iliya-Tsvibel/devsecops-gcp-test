from http.server import BaseHTTPRequestHandler, HTTPServer
import os

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Отвечаем и на "/" и на "/healthz", чтобы Cloud Run не ругался
        if self.path in ["/", "/healthz"]:
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"ok")
            return

        token = os.getenv("APP_TOKEN", "not-set").encode()
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello from Cloud Run!\nAPP_TOKEN=" + token)

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8080"))
    HTTPServer(("0.0.0.0", port), Handler).serve_forever()
