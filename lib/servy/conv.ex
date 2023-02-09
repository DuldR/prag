defmodule Servy.Conv do
  defstruct method: "",
            path: "",
            params: %{},
            headers: %{},
            resp_body: "",
            status: nil,
            resp_headers: %{"Content-Type" => "text/html", "Content-Length" => String.length("")}

  def full_status(conv) do
    "#{conv.status} #{status_reason(conv.status)}"
  end

  def put_resp_content(conv, content) do
    new_headers = %{conv.resp_headers | "Content-Type" => content}
    Map.put(conv, :resp_headers, new_headers)
  end

  def put_content_length(conv) do
    new_headers = %{conv.resp_headers | "Content-Length" => String.length(conv.resp_body)}
    Map.put(conv, :resp_headers, new_headers)
  end

  defp status_reason(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }[code]
  end
end
