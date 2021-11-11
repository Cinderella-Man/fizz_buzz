defmodule FizzBuzz do
  @moduledoc """
  FizzBuzz keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias FizzBuzz.FavouriteNumbers
  alias FizzBuzz.FavouriteNumber

  @spec fizz_buzz(integer()) :: String.t()
  def fizz_buzz(number) when is_integer(number) do
    case {rem(number, 3), rem(number, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      _ -> Integer.to_string(number)
    end
  end

  @spec generate_fizz_buzz(integer(), integer()) :: {:ok, [String.t()]} | {:error, :out_of_range}
  def generate_fizz_buzz(from, to) when is_integer(from) and is_integer(to) do
    if to > 100_000_000_000 do
      {:error, :out_of_range}
    else
      data =
        from..to
        |> Enum.map(fn n -> %{value: n, result: fizz_buzz(n)} end)

      {:ok, data}
    end
  end

  @spec generate_fizz_buzz(integer(), integer()) :: {:ok, [String.t()]} | {:error, :out_of_range}
  def range_with_favourites(from, to) when is_integer(from) and is_integer(to) do
    with {:ok, data} <-
           generate_fizz_buzz(from, to),
         favourite_numbers <-
           FavouriteNumbers.fetch_range(from, to),
         enriched_data <- merge_favourite_rows(data, favourite_numbers) do
      {:ok, enriched_data}
    else
      _ -> {:error, :out_of_range}
    end
  end

  @spec merge_favourite_rows([%{value: integer()}], [integer()]) :: [
          %{value: integer(), favourite: boolean()}
        ]
  def merge_favourite_rows(data, favourite_numbers) do
    data
    |> Enum.map(&merge_favourite_row(&1, favourite_numbers))
  end

  @spec merge_favourite_row(%{value: integer()}, [integer()]) :: %{
          value: integer(),
          favourite: boolean()
        }
  def merge_favourite_row(%{value: number} = row, favourite_numbers) do
    Map.put(row, :favourite, Enum.member?(favourite_numbers, number))
  end

  @spec set_as_favourite(integer()) :: {:ok, %FavouriteNumber{}}
  def set_as_favourite(number) when is_integer(number) do
    FavouriteNumbers.upsert_favourite_number(number)
  end
end
