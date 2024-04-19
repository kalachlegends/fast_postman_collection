defmodule TestAppWeb.AdminUserController do
  use TestAppWeb, :controller
  @moduledoc folder_path: "Admin folder/Админка"

  @moduledoc """
  # Artemka
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
