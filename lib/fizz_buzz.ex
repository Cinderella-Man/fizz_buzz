defmodule FizzBuzz do
  @moduledoc """
  FizzBuzz keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @spec fizz_buzz(integer()) :: String.t()
  def fizz_buzz(number) when is_integer(number) do
    case {rem(number, 3), rem(number, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      _ -> Integer.to_string(number)
    end
  end

  @spec generate_fizz_buzz(integer(), integer()) :: [String.t()]
  def generate_fizz_buzz(from, to) when is_integer(from) and is_integer(to) do
    from..to
    |> Enum.map(&fizz_buzz/1)
  end
end
