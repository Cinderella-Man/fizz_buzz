defmodule FizzBuzzWeb.PaginationTest do
  use ExUnit.Case

  alias FizzBuzzWeb.Pagination

  test "Pagination correctly validates valid data" do
    assert Pagination.parse(%{"page" => "5", "page_size" => "250"}) ==
             {:ok, %Pagination{offset: 1000, limit: 250}}
  end

  test "Pagination defaults to 1st page" do
    assert Pagination.parse(%{"page_size" => "250"}) ==
             {:ok, %Pagination{offset: 0, limit: 250}}
  end

  test "Pagination default to 100 items per page" do
    assert Pagination.parse(%{"page" => "3"}) ==
             {:ok, %Pagination{offset: 200, limit: 100}}
  end

  test "Pagination default to 1st page and 100 items per page" do
    assert Pagination.parse(%{}) ==
             {:ok, %Pagination{offset: 0, limit: 100}}
  end
end
