defmodule WebScrapperTest do
  use ExUnit.Case
  doctest WebScrapper

  test "greets the world" do
    assert WebScrapper.hello() == :world
  end
end
