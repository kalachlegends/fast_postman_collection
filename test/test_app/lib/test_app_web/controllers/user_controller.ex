defmodule TestAppWeb.UserController do
  use TestAppWeb, :controller
  @moduledoc test: "test"

  @moduledoc """
  # Artem
  """

  @doc """
  # asdad
  This route index
  """
  @doc params: %{}
  def index(conn, params) do
    json(conn, params)
  end
end
