defmodule WebScrapper do
  def get_meetup(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body, status_code: status_code}} ->
        IO.puts body
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts reason
    end
  end
end
