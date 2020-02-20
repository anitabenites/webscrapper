defmodule WebScrapper do
  def get_meetup(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body, status_code: status_code}} ->
        body
      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end

  def get_text(doc) do
    {:ok, html} = Floki.parse_document(doc)
    # IO.inspect(doc, label: "this is the doc")
    Floki.find(html, ".exploreHome-categories-title")
    |> Enum.filter(fn {html, _ , [text]} -> text == "Tech" end)
  end

end
