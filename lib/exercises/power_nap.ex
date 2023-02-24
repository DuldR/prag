defmodule PowerNap do
  def nap_time(parent_pid) do
    time = :rand.uniform(10_000)
    :timer.sleep(time)
    send(parent_pid, {:slept, time})
  end

  def check_process do
    parent = self()
    spawn(fn -> nap_time(parent) end)

    receive do
      {:slept, time} -> IO.puts("Slept #{time} ms")
    end
  end
end
