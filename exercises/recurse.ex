defmodule Recurse do

  def sum([h | t], sum) do

    IO.puts("Head: #{h} Tail: #{inspect(t)}")
    sum(t, sum + h) 

  end

  def sum([], sum), do: IO.puts(sum)


  def triple([h | t], triple) do
    IO.puts("Head: #{h} Tail: #{inspect(t)}")
    triple(t, [h * 3 | triple])
  end

  def triple([], triple), do: IO.inspect(Enum.reverse(triple))

  def my_map(arr, fun) do
    my_map(arr, fun, [])
  end

  defp my_map([h | t], fun, mapped_arr) do
    my_map(t, fun, [fun.(h) | mapped_arr])
  end

  defp my_map([], _fun, mapped_arr), do: Enum.reverse(mapped_arr)


end

IO.inspect Recurse.my_map([1,2,3,4,5], &(&1 = 2))


# Recurse.sum([1,2,3,4,5], 0)
# Recurse.triple([1,2,3,4,5], [])
