defmodule FastCollection do
  def generate(attrs \\ %{}) do
    FastCollection.Collect.generate_data_by_router()
    |> FastCollection.GenerateCollection.generate(attrs)
  end

  def generate_json(attrs \\ %{}) do
    FastCollection.Collect.generate_data_by_router()
    |> FastCollection.GenerateCollection.generate_to_json(attrs)
  end
end
