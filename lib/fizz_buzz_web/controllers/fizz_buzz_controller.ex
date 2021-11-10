defmodule FizzBuzzWeb.FizzBuzzController do
  use FizzBuzzWeb, :controller

  alias FizzBuzzWeb.Pagination
  alias FizzBuzz.FavouriteNumbers

  def index(conn, params) do
    with {:ok, pagination} <- Pagination.parse(params),
         {:ok, data} <-
           FizzBuzz.generate_fizz_buzz(pagination.offset, pagination.offset + pagination.limit),
         favourite_numbers <-
           FavouriteNumbers.fetch_range(pagination.offset, pagination.offset + pagination.limit),
         enriched_data <- FizzBuzz.merge_favourite_rows(data, favourite_numbers),
         paginated_data <- Pagination.wrap(enriched_data, pagination) do
      json(conn, paginated_data)
    else
      # TO DO - HANDLE THIS BETTER
      _ -> json(conn, "Error occurred")
    end
  end
end
