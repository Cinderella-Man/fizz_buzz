defmodule FizzBuzzWeb.PaginationTest do
  use ExUnit.Case

  test "Pagination correctly validates valid data" do
    assert FizzBuzzWeb.Pagination.validate_params(%{"page" => "5", "page_size" => "250"}) ==
             {:ok, %{page: 5, page_size: 250}}
  end

  test "Pagination defaults to 1st page" do
    assert FizzBuzzWeb.Pagination.validate_params(%{"page_size" => "250"}) ==
             {:ok, %{page: 1, page_size: 250}}
  end

  test "Pagination default to 100 items per page" do
    assert FizzBuzzWeb.Pagination.validate_params(%{"page" => "3"}) ==
             {:ok, %{page: 3, page_size: 100}}
  end

  test "Pagination default to 1st page and 100 items per page" do
    assert FizzBuzzWeb.Pagination.validate_params(%{}) ==
             {:ok, %{page: 1, page_size: 100}}
  end
end
