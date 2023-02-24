defmodule UserApi do
  def query(user_id) do
    case HTTPoison.get("https://jsonplaceholder.typicode.com/users/#{user_id}") do
      {:ok, response} ->
        body_map = Poison.Parser.parse!(response.body, %{})
        {:ok, get_in(body_map, ["address", "city"])}

      {:error, error} ->
        error

      _ ->
        :not_found
    end
  end
end
