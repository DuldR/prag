defmodule Servy.KickStarter do
  use GenServer

  def start do
    IO.puts("Starting the kick")

    GenServer.start(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    Process.flag(:trap_exit, true)
    server_pid = start_server()
    {:ok, server_pid}
  end

  def handle_info({:EXIT, _pid, reason}, _state) do
    IO.puts("BRUH #{inspect(reason)}")
    server_pid = spawn(Servy.HttpServer, :start, [4000])
    {:noreply, server_pid}
  end

  def start_server do
    server_pid = spawn_link(Servy.HttpServer, :start, [4000])
    Process.register(server_pid, :http_server)
    server_pid
  end
end
