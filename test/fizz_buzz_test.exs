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

  test "generate_fizz_buzz returns expected results" do
    assert FizzBuzz.generate_fizz_buzz(1, 15) ==
             {:ok,
              [
                %{result: "1", value: 1},
                %{result: "2", value: 2},
                %{result: "Fizz", value: 3},
                %{result: "4", value: 4},
                %{result: "Buzz", value: 5},
                %{result: "Fizz", value: 6},
                %{result: "7", value: 7},
                %{result: "8", value: 8},
                %{result: "Fizz", value: 9},
                %{result: "Buzz", value: 10},
                %{result: "11", value: 11},
                %{result: "Fizz", value: 12},
                %{result: "13", value: 13},
                %{result: "14", value: 14},
                %{result: "FizzBuzz", value: 15}
              ]}
  end
end
