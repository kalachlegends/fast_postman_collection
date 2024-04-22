defmodule TestAppWeb.AdminPostController do
  use TestAppWeb, :controller
  @moduledoc folder_path: "Admin folder"

  @moduledoc """
  # Post controller
  """

  @doc """
  # Post admin controller
  This route index
  """
  @doc params: %{
         page: "1",
         limit: "2"
       }
  def index(conn, params) do
    json(conn, params)
  end

  @doc """
  # Create post

  """
  @doc body: %{
         post: %{
           title: "",
           new_title_popular: ""
         }
       }
  def create_post(conn, params) do
    json(conn, params)
  end
end
