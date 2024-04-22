defmodule FastCollection.Config do
  alias FastCollection.GenerateCollection.Structs.Variable
  @cwd File.cwd!()
  def get_pipe_tokens() do
    case Application.fetch_env(:fast_collection, :pipe_tokens) do
      {:ok, value} when is_list(value) -> value
      :error -> []
    end
  end

  def get_file_path_to_generate do
    case Application.fetch_env(:fast_collection, :file_path_collection) do
      {:ok, value} when is_binary(value) -> value <> get_name_collection() <> ".json"
      :error -> "#{@cwd}/#{get_name_collection() <> ".json"}"
    end
  end

  def get_name_collection do
    case Application.fetch_env(:fast_collection, :name_collection) do
      {:ok, value} when is_binary(value) -> value
      :error -> "Collection"
    end
  end

  def get_variables() do
    case Application.fetch_env(:fast_collection, :variables) do
      {:ok, value} when is_list(value) ->
        value

      :error ->
        [%Variable{key: "host", value: "http://localhost:4000"}]
    end
  end
end
