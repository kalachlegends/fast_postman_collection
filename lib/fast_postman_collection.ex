defmodule FastPostmanCollection do
  @moduledoc """
  Read readme
  """
  def generate(attrs \\ %{}) do
    FastPostmanCollection.Collect.generate_data_by_router()
    |> FastPostmanCollection.GenerateCollection.generate(attrs)
  end

  def generate_json(attrs \\ %{}) do
    FastPostmanCollection.Collect.generate_data_by_router()
    |> FastPostmanCollection.GenerateCollection.generate_to_json(attrs)
  end
end
