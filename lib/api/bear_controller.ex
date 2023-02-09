defmodule Servy.Api.BearController do
  alias Servy.Conv

  def index(conv) do
    json =
      Servy.Wildthings.list_bears()
      |> Poison.encode!()

    conv = Conv.put_resp_content(conv, "application/json")
    %{conv | status: 200, resp_body: json}
  end

  def create(conv) do
    body = "Created a #{conv.params["type"]} bear named #{conv.params["name"]}!"
    conv = Conv.put_resp_content(conv, "text/html")
    %{conv | status: 201, resp_body: body}
  end
end
