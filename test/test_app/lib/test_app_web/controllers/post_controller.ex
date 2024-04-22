defmodule TestAppWeb.PostController do
  use TestAppWeb, :controller

  @moduledoc """
  # post router
  """

  @doc """
  # post index
  This route index
  """
  @doc params: %{
         limit: "2000321312",
         page: "123123"
       }
  def index(conn, params) do
    json(conn, params)
  end
end
