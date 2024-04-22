defmodule TestAppWeb.UserController do
  use TestAppWeb, :controller
  @moduledoc filter: "test"

  @doc """
  # User index
  This route index
  """
  @doc params: %{something: "something_in_paramss", page: 3_245_435_123}
  @doc body: %{something_in_body: "get_someting_in_body"}
  def index(conn, params) do
    json(conn, params)
  end

  def some_uniq_function(conn, params) do
    json(conn, params)
  end
end
