defmodule FizzBuzzWeb.FizzBuzzController do
  use FizzBuzzWeb, :controller

  def index(conn, params) do
    
    json(conn, "Hello world")
  end
end
