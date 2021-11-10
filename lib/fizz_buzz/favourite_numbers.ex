defmodule FizzBuzz.FavouriteNumbers do
  import Ecto.Query

  alias FizzBuzz.FavouriteNumber
  alias FizzBuzz.Repo

  @spec fetch_range(integer(), integer()) :: [%FavouriteNumber{}]
  def fetch_range(from, to) when is_integer(from) and is_integer(to) do
    FavouriteNumber
    |> where([fnum], fnum.number >= ^from)
    |> where([fnum], fnum.number <= ^to)
    |> Repo.all()
  end
end
