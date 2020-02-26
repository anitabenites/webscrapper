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

  def get_links do
    {:ok, html} = Floki.parse_document(get_meetup("https://www.meetup.com/find/language/"))
    # IO.inspect(html, label: "This is the html")
    Floki.find(html, "a.groupCard--photo")
    |> Enum.flat_map(fn {html, attrs , _ } -> Enum.filter( attrs, fn {attr, value} -> attr == "href" end) end)
    |> Enum.map(fn {attr, value} -> value end)
  end

#a function that has one single responsability
  def extract_event(url) do
    {:ok, html} = Floki.parse_document(get_meetup(url))
    [ result_one | _ ] = Floki.find(html, ".groupHomeHeader-groupNameLink")
    [ result_second | _ ] = Floki.find(html, ".groupHomeHeaderInfo-cityLink")
    [ result_three | _ ] = Floki.find(html, "#overview")
    Floki.text(result_one)
    Floki.text(result_second)
    Floki.text(result_three)
  end
#TO_DO:save the information in a csv file.
  # def save_event do
  #
  # end

end

#documentation
#IO.inspect
