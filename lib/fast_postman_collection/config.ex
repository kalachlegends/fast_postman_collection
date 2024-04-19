defmodule FastPostmanCollection.Config do
  def get_pipe_tokens() do
    case Application.fetch_env(:fast_postman_collection, :pipe_tokens) do
      {:ok, value} when is_list(value) -> value
      :error -> []
    end
  end
end
