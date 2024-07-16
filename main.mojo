from lightbug_http.sys.server import SysServer
from lightbug_http.http import HTTPRequest, HTTPResponse, OK
from lightbug_http.service import HTTPService


@value
struct HelloWorld(HTTPService):
   fn func(self, req: HTTPRequest) raises -> HTTPResponse:
      var body = "hello world"
      print(String(body))
      return OK(body, "text/plain")

fn main() raises:
    var server = SysServer()
    var handler = HelloWorld()
    server.listen_and_serve("0.0.0.0:8080", handler)