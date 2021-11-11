defmodule FizzBuzzWeb.FizzBuzzController do
  use FizzBuzzWeb, :controller

  alias FizzBuzzWeb.Pagination

  def index(conn, params) do
    with {:ok, pagination} <- Pagination.parse(params),
         {:ok, enriched_data} <-
           FizzBuzz.range_with_favourites(pagination),
         paginated_data <- Pagination.wrap(enriched_data, pagination) do
      json(conn, paginated_data)
    else
      # TO DO - HANDLE THIS BETTER (500? 400?)
      _ -> json(conn, "Error occurred")
    end
  end

  def create(conn, %{"number" => number_string}) do
    with {number, ""} <- Integer.parse(number_string),
         {:ok, _res} <- FizzBuzz.set_as_favourite(number) do
      json(conn, :ok)
    else
      # TO DO - HANDLE THIS BETTER (500? 400?)
      _ -> json(conn, "Error occurred")
    end
  end
end
