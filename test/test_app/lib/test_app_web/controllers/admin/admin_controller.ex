defmodule TestAppWeb.AdminController do
  use TestAppWeb, :controller
  @moduledoc folder_path: "Admin folder/something"

  @moduledoc """
  # Artem
  """

  @doc """
  # asdad
  This route index
  """
  @doc params: %{}
  @doc body: %{}
  def index(conn, params) do
    json(conn, params)
  end
end
