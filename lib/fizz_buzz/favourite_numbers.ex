defmodule FizzBuzz.FavouriteNumbers do
  import Ecto.Query

  alias FizzBuzz.FavouriteNumber
  alias FizzBuzz.Repo

  @spec fetch_range(integer(), integer()) :: [integer()]
  def fetch_range(from, to) when is_integer(from) and is_integer(to) do
    FavouriteNumber
    |> select([fnum], fnum.id)
    |> where([fnum], fnum.id >= ^from)
    |> where([fnum], fnum.id <= ^to)
    |> Repo.all()
  end

  def upsert_favourite_number(number) do
    result =
      %FavouriteNumber{id: number}
      |> Repo.insert!(on_conflict: :nothing)

    {:ok, result}
  end
end
