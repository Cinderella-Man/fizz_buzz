defmodule FizzBuzzWeb.FizzBuzzController do
  use FizzBuzzWeb, :controller

  alias FizzBuzzWeb.Pagination

  def index(conn, params) do
    with {:ok, pagination} <- Pagination.parse(params),
         {:ok, data} <-
           FizzBuzz.generate_fizz_buzz(pagination.offset, pagination.offset + pagination.limit),
         paginated_data <- Pagination.wrap(data, pagination) do
      json(conn, paginated_data)
    else
      # TO DO - HANDLE THIS BETTER
      _ -> json(conn, "Error occurred")
    end
  end
end
