defmodule FizzBuzzWeb.Pagination do
  defstruct offset: 0, limit: 100

  @spec parse(%{String.t() => String.t()}) ::
          {:ok, %__MODULE__{offset: integer, limit: integer}} | {:error, :invalid_params}
  def parse(params) do
    page_string = Map.get(params, "page", "1")
    page_size_string = Map.get(params, "page_size", "100")

    with {page, ""} <- Integer.parse(page_string),
         {page_size, ""} <- Integer.parse(page_size_string) do
      {:ok, %__MODULE__{offset: (page - 1) * page_size, limit: page_size}}
    else
      _ -> {:error, :invalid_params}
    end
  end

  def wrap(data, %__MODULE__{offset: offset, limit: limit}) do
    page = Integer.floor_div(offset, limit)

    %{
      data: data,
      page: page,
      page_size: limit
    }
    |> Map.merge(
      unless(offset + limit > 100_000_000_000,
        do: %{next_page: "?page=#{page + 2}&page_size=#{limit}"},
        else: %{}
      )
    )
    |> Map.merge(
      unless(page < 1, do: %{previous_page: "?page=#{page}&page_size=#{limit}"}, else: %{})
    )
  end
end
