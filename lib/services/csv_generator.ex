defmodule WebScrapper.Services.CsvGenerator do
  alias WebScrapper
  alias CSV

  def generator_csv(url) do
    # File.write("../txt.csv", CSV.encode(WebScrapper.extract_event(url)))
    file = File.open!("test.csv", [:write, :utf8])
    [WebScrapper.extract_event(url)] |> CSV.encode |> Enum.each(fn n -> IO.write(file, n) end)
  end
end
