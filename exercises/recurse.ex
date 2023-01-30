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

end


# Recurse.sum([1,2,3,4,5], 0)
# Recurse.triple([1,2,3,4,5], [])
