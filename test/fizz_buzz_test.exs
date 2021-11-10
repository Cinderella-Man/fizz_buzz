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

  test "merge_favourite_rows merges rows" do
    rows = [
      %{value: 2, result: "2"},
      %{value: 3, result: "Fizz"},
      %{value: 5, result: "Buzz"}
    ]

    expected_result = [
      %{value: 2, result: "2", favourite: false},
      %{value: 3, result: "Fizz", favourite: true},
      %{value: 5, result: "Buzz", favourite: false}
    ]

    assert FizzBuzz.merge_favourite_rows(rows, [3]) == expected_result
  end

  test "merge_favourite_row merges rows(favourite)" do
    row = %{value: 3, result: "Fizz"}
    expected_result = %{value: 3, result: "Fizz", favourite: true}
    assert FizzBuzz.merge_favourite_row(row, [3]) == expected_result
  end

  test "merge_favourite_row merges rows(not favourite)" do
    row = %{value: 3, result: "Fizz"}
    expected_result = %{value: 3, result: "Fizz", favourite: false}
    assert FizzBuzz.merge_favourite_row(row, [4]) == expected_result
  end

  test "merge_favourite_row merges rows(empty favourite)" do
    row = %{value: 4, result: "4"}
    expected_result = %{value: 4, result: "4", favourite: false}
    assert FizzBuzz.merge_favourite_row(row, []) == expected_result
  end
end
