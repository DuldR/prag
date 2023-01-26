defmodule Servy.Conv do
  defstruct [ 
    method: "", 
    path: "", 
    resp_body: "", 
    status: nil,
    params: %{}
  ]

  def full_status(conv) do
    "#{conv.status} #{status_reason(conv.status)}"
  end

  defp status_reason(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauth",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal"
    }[code]

  end
end