defmodule HttpServerTest do
  use ExUnit.Case
  alias Servy.HttpClient
  alias Servy.Handler
  alias Servy.{HttpServer, HttpServerTest}

  test "testing http server" do
    spawn(fn -> HttpServer.start(4000) end)

    request = """
    GET /wildthings HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    response = HttpClient.send_request(request)

    assert response == """
           HTTP/1.1 200 OK\r
           Content-Type: text/html\r
           Content-Length: 20\r
           \r
           Bears, Lions, Tigers
           """
  end
end
