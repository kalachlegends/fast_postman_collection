defmodule FastPostmanCollection.GenerateCollection.Structs.Body do
  alias FastPostmanCollection.CollectDataItemParams
  alias FastPostmanCollection.CollectDataItem

  defstruct mode: "raw",
            raw: "",
            formdata: "",
            disabled: true,
            options: %{
              raw: %{
                language: "json"
              }
            }

  def generate(item = %CollectDataItem{}) do
    doc_params = item.doc_params

    %__MODULE__{
      mode: doc_params.mode || "raw",
      raw: doc_params.body |> Jason.encode!(pretty: true),
      formdata: doc_params.formdata,
      disabled: is_disabled(doc_params)
    }
  end

  def is_disabled(doc_params = %CollectDataItemParams{}) do
    list = [:mode, :formdata, :body, :language]
    is_disabled = Enum.any?(doc_params |> Map.from_struct(), fn {k, _v} -> k in list end)

    cond do
      is_boolean(doc_params.body_disabled) -> doc_params.body_disabled
      true -> is_disabled
    end
  end
end
