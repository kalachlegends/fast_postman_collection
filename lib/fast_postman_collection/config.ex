defmodule FastPostmanCollection.Config do
  alias FastPostmanCollection.GenerateCollection.Structs.Variable
  @otp_app Mix.Project.config()[:app]
  @file_contents Application.app_dir(@otp_app)
  def get_pipe_tokens() do
    case Application.fetch_env(:fast_postman_collection, :pipe_tokens) do
      {:ok, value} when is_list(value) -> value
      :error -> []
    end
  end

  def get_file_path_to_generate do
    case Application.fetch_env(:fast_postman_collection, :file_path_collection) do
      {:ok, value} when is_binary(value) -> value <> get_name_collection() <> ".json"
      :error -> "./#{get_name_collection() <> ".json"}"
    end
  end

  def get_name_collection do
    case Application.fetch_env(:fast_postman_collection, :name_collection) do
      {:ok, value} when is_binary(value) -> value
      :error -> "Collection"
    end
  end

  def get_variables() do
    case Application.fetch_env(:fast_postman_collection, :variables) do
      {:ok, value} when is_list(value) ->
        value

      :error ->
        [%Variable{key: "host", value: "http://localhost:4000"}]
    end
  end
end
