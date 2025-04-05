defmodule TestAppWeb.AdminUserController do
  use TestAppWeb, :controller
  @moduledoc folder_path: "Admin folder/something"

  @moduledoc """
  # Artemka
  """

  @doc """
  # Title test
  ADMIN USER
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
