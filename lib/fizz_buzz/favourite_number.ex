defmodule FizzBuzz.FavouriteNumber do
  use Ecto.Schema

  schema "favourite_numbers" do
    field :number, :integer
  end
end
