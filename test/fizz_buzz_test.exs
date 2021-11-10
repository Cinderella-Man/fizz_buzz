defmodule FizzBuzzTest do
  use ExUnit.Case

  test "FizzBuzz returns expected results" do
    [
      {1, "1"},
      {2, "2"},
      {3, "Fizz"},
      {5, "Buzz"},
      {6, "Fizz"},
      {10, "Buzz"},
      {12, "Fizz"},
      {15, "FizzBuzz"}
    ]
    |> Enum.each(fn {number, expected_result} ->
      assert FizzBuzz.fizz_buzz(number) == expected_result
    end)
  end
end
