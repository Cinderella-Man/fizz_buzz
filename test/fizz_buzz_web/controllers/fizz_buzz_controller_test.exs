defmodule FizzBuzzWeb.FizzBuzzControllerTest do
  use FizzBuzzWeb.ConnCase

  describe "API listing FizzBuzz numbers" do
    test "list first 100 numbers", %{conn: conn} do
      conn = get(conn, Routes.fizz_buzz_path(conn, :index))
      data = json_response(conn, 200)["data"]
      assert length(data) == 100

      assert Enum.at(data, 0) == %{"favourite" => false, "result" => "1", "value" => 1}
      assert Enum.at(data, 14) == %{"favourite" => false, "result" => "FizzBuzz", "value" => 15}
    end

    test "list second page with limit 3 numbers", %{conn: conn} do
      conn = get(conn, Routes.fizz_buzz_path(conn, :index, %{"page" => "2", "page_size" => "3"}))
      data = json_response(conn, 200)["data"]
      assert length(data) == 3

      assert Enum.at(data, 0) == %{"favourite" => false, "result" => "4", "value" => 4}
      assert Enum.at(data, 2) == %{"favourite" => false, "result" => "Fizz", "value" => 6}
    end

    test "list second page without limit(default 100) numbers", %{conn: conn} do
      conn = get(conn, Routes.fizz_buzz_path(conn, :index, %{"page" => "2"}))
      data = json_response(conn, 200)["data"]
      assert length(data) == 100

      assert Enum.at(data, 0) == %{"favourite" => false, "result" => "101", "value" => 101}
      assert Enum.at(data, 4) == %{"favourite" => false, "result" => "FizzBuzz", "value" => 105}
    end

    test "list default page(1) with limit(3) numbers", %{conn: conn} do
      conn = get(conn, Routes.fizz_buzz_path(conn, :index, %{"page_size" => "3"}))
      data = json_response(conn, 200)["data"]
      assert length(data) == 3

      assert Enum.at(data, 0) == %{"favourite" => false, "result" => "1", "value" => 1}
      assert Enum.at(data, 2) == %{"favourite" => false, "result" => "Fizz", "value" => 3}
    end
  end

  describe "API setting FizzBuzz number as favourite" do
    test "setting number", %{conn: conn} do
      conn = post(conn, Routes.fizz_buzz_path(conn, :create, %{"number" => "3"}))
      data = json_response(conn, 200)
      assert data == "ok"

      # Now getting the fizz_buzz list to confirm it's favourite

      conn = get(conn, Routes.fizz_buzz_path(conn, :index, %{"page_size" => "3"}))
      data = json_response(conn, 200)["data"]
      assert length(data) == 3

      assert Enum.at(data, 0) == %{"favourite" => false, "result" => "1", "value" => 1}
      assert Enum.at(data, 1) == %{"favourite" => false, "result" => "2", "value" => 2}
      assert Enum.at(data, 2) == %{"favourite" => true, "result" => "Fizz", "value" => 3}
    end
  end
end
