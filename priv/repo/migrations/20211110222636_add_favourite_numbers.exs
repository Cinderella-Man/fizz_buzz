defmodule FizzBuzz.Repo.Migrations.AddFavouriteNumbers do
  use Ecto.Migration

  def up do
    create table("favourite_numbers") do
      add :number, :integer
    end
  end

  def down do
    drop table("favourite_numbers")
  end
end
