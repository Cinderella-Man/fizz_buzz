defmodule FizzBuzzWeb.PageControllerTest do
  use FizzBuzzWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "FizzBuzz · Phoenix Framework"
  end
end
