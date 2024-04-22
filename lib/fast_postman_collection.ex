defmodule FastPostmanCollection do
  @cwd File.cwd!()
  @moduledoc File.read!(@cwd <> "/README.md")
  def generate(attrs \\ %{}) do
    FastPostmanCollection.Collect.generate_data_by_router()
    |> FastPostmanCollection.GenerateCollection.generate(attrs)
  end

  def generate_json(attrs \\ %{}) do
    FastPostmanCollection.Collect.generate_data_by_router()
    |> FastPostmanCollection.GenerateCollection.generate_to_json(attrs)
  end
end
