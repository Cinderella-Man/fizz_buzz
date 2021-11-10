defmodule FizzBuzzWeb.Pagination do
  defstruct values: [], page: 1, page_size: 100

  def validate_params(params) do
    page_string = Map.get(params, "page", "1")
    page_size_string = Map.get(params, "page_size", "100")

    with {page, ""} <- Integer.parse(page_string),
         {page_size, ""} <- Integer.parse(page_size_string) do
      {:ok, %{page: page, page_size: page_size}}
    else
      _ -> {:error, :invalid_params}
    end
  end
end
