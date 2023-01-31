defmodule Cards do


  def comp(ranks, suits) do
    deck = for i <- ranks, j <- suits, do: {i, j}
		
		deck
		|> Enum.shuffle
		|> Enum.chunk_every(13)
  end
end

ranks =
  [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]

suits =
  [ "♣", "♦", "♥", "♠" ]

IO.inspect Cards.comp(ranks, suits)
