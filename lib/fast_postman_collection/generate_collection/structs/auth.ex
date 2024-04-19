defmodule FastPostmanCollection.GenerateCollection.Structs.Auth do
  defstruct type: "bearer", bearer: []
  alias FastPostmanCollection.CollectDataItem

  def generate(item = %CollectDataItem{}) do
    %__MODULE__{
      type: "bearer",
      bearer: get_config_auth_pipe(item)
    }
  end

  def get_config_auth_pipe(item = %CollectDataItem{}) do
    tokens = FastPostmanCollection.Config.get_pipe_tokens()

    item.pipe_through
    |> Enum.filter(fn x -> x in tokens end)
    |> Enum.map(fn x ->
      name_token = Atom.to_string(x) <> "_token"
      %{key: name_token, value: "{{#{name_token}}}", type: "string"}
    end)
  end
end
