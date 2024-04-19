defmodule TestAppWeb.AdminPostController do
  use TestAppWeb, :controller
  @moduledoc folder_path: "Admin folder/Админка"

  @moduledoc """
  # Post controller
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
