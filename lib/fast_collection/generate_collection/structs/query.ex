defmodule FastCollection.GenerateCollection.Structs.Query do
  alias FastCollection.CollectDataItemParams
  defstruct key: "", value: "", disabled: false, description: nil

  def generate(doc_params = %CollectDataItemParams{}) do
    if is_map(doc_params.params) do
      doc_params.params
      |> Enum.map(fn {key, value} ->
        if is_map(value) do
          %__MODULE__{
            key: key,
            value: value[:value],
            disabled: value[:disabled],
            description: value[:description]
          }
        else
          %__MODULE__{
            key: key,
            value: value |> to_string()
          }
        end
      end)
    end
  end
end
