defmodule TestAppWeb.PostController do
  use TestAppWeb, :controller

  @moduledoc """
  # post router
  """

  @doc """
  # post router
  This route index
  """
  @doc params: %{}
  def index(conn, params) do
    json(conn, params)
  end
end
