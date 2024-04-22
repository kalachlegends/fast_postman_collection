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
  @doc mode: "formdata"
  @doc formdata: [
         %{
           key: "image",
           value: nil,
           type: "file"
         }
       ]
  def index(conn, params) do
    json(conn, params)
  end
end
