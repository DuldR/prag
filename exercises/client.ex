defmodule Servy.HttpClient do
  def start() do
    some_host_in_net = "localhost"

    # {:ok, sock} = :gen_tcp.connect(some_host_in_net, 4000, [:binary, packet: :raw, active: false])

    {:ok, sock} = :gen_tcp.connect(some_host_in_net, 4000, [:binary, packet: :raw, active: false])

    :ok = :gen_tcp.send(sock, request())
    {:ok, response} = :gen_tcp.recv(sock, 0)
    :ok = :gen_tcp.close(sock)
    response
  end

  def request() do
    """
    GET /bears HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """
  end
end

response = Servy.HttpClient.start()
IO.inspect(response)
