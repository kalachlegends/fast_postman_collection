defmodule FastPostmanCollection.GenerateCollection.Structs.Url do
  defstruct [:raw, host: [], path: [], query: [], variable: []]
  alias FastPostmanCollection.GenerateCollection.Structs.Query
  alias FastPostmanCollection.CollectDataItem

  def generate(item = %CollectDataItem{}) do
    doc_params = item.doc_params

    %__MODULE__{
      raw: item.route,
      path: item.route |> generate_path(),
      variable: doc_params.url_variable,
      query: Query.generate(doc_params)
    }
  end

  defp generate_path(item) do
    Regex.scan(~r/(\/|:)\w+/, item)
    |> Enum.map(fn x -> hd(x) |> String.replace(~r/(\/)/, "") end)
  end
end
