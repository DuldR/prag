defmodule Timer do
  def remind(action, time) do
    spawn(fn ->
      :timer.sleep(time)
      IO.puts(action)
    end)
  end
end
